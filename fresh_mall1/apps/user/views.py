from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout  # django内部认证
from celery_tasks.tasks import send_register_active_email
from django.core.mail import send_mail  # django内置发送邮件
from django.views import View
from django.http import HttpResponse
from django.urls import reverse
from django.db import DatabaseError
from django.conf import settings
import re
import time
from order.models import OrderInfo, OrderGoods
from django.core.paginator import Paginator

from user.models import User, Address
from goods.models import GoodsSKU

from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import SignatureExpired

from utils.Mixin import LoginReguiredMixin

from django_redis import get_redis_connection  # 导入redis数据库


# Create your views here.

class RegisterView(View):
    """用户注册"""

    def get(self, request):
        """提供用户注册页面"""
        return render(request, 'register.html')

    def post(self, request):
        """用户注册数据处理"""
        # 接受参数
        username = request.POST.get('user_name')
        password = request.POST.get('pwd')
        email = request.POST.get('email')
        allow = request.POST.get('allow')
        # 验证数据 --> 判断数据是否完整 --> 不完整返回错误
        if not all([username, password, email]):
            return render(request, 'register.html', {'errmsg': "数据不完整"})

        # 验证邮箱
        if not re.match(r'^[a-z0-9][\w.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$',
                        email):
            return render(request, 'register.html', {'errmsg': "邮箱格式不正确"})

        # 判断是否勾选协议
        if allow != 'on':
            return render(request, 'register.html', {'errmsg': "请勾选同意协议！"})

        # 校验用户名是否重复
        try:
            user = User.objects.get(username=username)
        except User.DoesNotExist:
            # 用户名不存在，可用
            user = None

        if user:
            # 用户名存在
            return render(request, 'register.html', {'errmsg': '用户名已存在'})

        # 进行业务处理: 进行用户注册
        user = User.objects.create_user(username, email, password)
        # 激活字段，默认为没有激活
        user.is_active = 1
        user.save()
        # 发送激活邮件，包含激活连接： http：//127.0.0.1：8000/user/active/用户id
        # 激活连接中需要包含用户的身份信息，并且要把身份信息进行加密处理

        # 加密用户的身份信息，生成激活的token
        serializer = Serializer(settings.SECRET_KEY, 3600)
        info = {'confirm': user.id}
        token = serializer.dumps(info)
        token = token.decode('utf8')

        # 发邮件
        # send_register_active_email.delay (email, username, token)
        subject = '商城'
        message = ''
        sender = settings.EMAIL_FROM
        receiver = [email]
        html_message = '<h1>%s, 欢迎注册<h1>请点击下面链接激活你的账号<br/>' \
                       '<a href="http://127.0.0.1:8000/user/active/%s">' \
                       'http://127.0.0.1:8000/user/active/%s</a>' % (
                       username, token, token)

        send_mail(subject, message, sender, receiver,
                  html_message=html_message)
        # time.sleep (5)

        # 返回应答,跳转到首页
        return redirect(reverse('goods:index'))


class ActiveView(View):
    """用户激活"""

    def get(self, request, token):
        # 进行解密
        serializer = Serializer(settings.SECRET_KEY, 3600)
        try:
            info = serializer.loads(token)
            # 获取待激活用户的ID
            user_id = info['confirm']
            # 根据id获取用户信息
            user = User.objects.get(id=user_id)
            user.is_active = 1
            user.save()
            # 跳转登录页面
            return redirect(reverse('user:login'))
        except SignatureExpired as e:
            # 激活链接已过期
            return HttpResponse('激活链接已过期')


class LoginView(View):
    """用户登录"""

    def get(self, request):
        """提供用户登录页面"""
        # 判断是否记住用户名
        if 'username' in request.COOKIES:
            username = request.COOKIES.get('username')
            checked = 'checked'
        else:
            username = ''
            checked = ''
        return render(request, 'login.html',
                      {'username': username, 'checked': checked})

    def post(self, request):
        # 接受参数
        username = request.POST.get('username')
        password = request.POST.get('pwd')

        # 判断参数是否缺少
        if not all([username, password]):
            return render(request, 'login.html', {'errmsg': '请输入用户名或者密码'})

        # 业务逻辑处理， 查询数据库是否有username， 使用django内置authenticate查询
        user = authenticate(username=username, password=password)
        # 判断用户名是否为空
        if user is None:
            return render(request, 'login.html', {'errmsg': '用户名或者密码错误'})
        # 状态保持
        login(request, user)
        # 获取登录后所要跳转到的地址
        # 默认跳转到首页
        next_url = request.GET.get('next', reverse('goods:index'))  # None

        # 跳转到首页
        response = redirect(next_url)

        # 判断是否需要记录用户名
        remember = request.POST.get('remember')
        if remember == 'on':
            # 记住用户名
            response.set_cookie('username', username, max_age=3600)
        else:
            response.delete_cookie('username')
        return response

        # 响应结果


class LogoutView(View):
    """退出登录"""

    def get(self, request):
        """退出登录"""
        # 清除用户的session信息
        logout(request)

        # 跳转到首页
        return redirect(reverse('goods:index'))


class UserInfoView(LoginReguiredMixin, View):
    """用户中心 信息页"""

    def get(self, request):
        "显示"
        # 获取用户个人信息
        user = request.user
        # 获取用户的默认收货地址
        # try:
        #     address = Address.objects.get (user=user, is_default=True)
        # except Address.DoesNotExist:
        #     # 不存在默认地址
        #     address = None
        address = Address.objects.get_default_address(user)

        # 获取用户的历史浏览记录

        # from redis import StrictRedis
        # sr = StrictRedis(host='127.0.0.1:6379', port='6379', db=1)
        con = get_redis_connection('default')
        history_key = 'history_%d' % user.id

        # 获取用户最新浏览的5个商品的id
        sku_ids = con.lrange(history_key, 0, 4)
        # 从数据库中查询用户浏览的商品的具体信息
        # goods_li = GoodsSKU.objects.filter(id__in=sku_ids)

        # 第一种方式
        # goods_res = []
        # for a_id in sku_ids:
        #     for goods in goods_li:
        #         if a_id == goods.id:
        #             goods_res.append(goods)

        # 第二种方式：对应id一个一个的从数据库拿
        goods_li = []
        for id in sku_ids:
            goods = GoodsSKU.objects.get(id=id)
            goods_li.append(goods)

        # 组织上下文
        context = {'page': 'user',
                   'address': address,
                   'goods_li': goods_li}

        return render(request, 'user_center_info.html', context)


class userOrderView(LoginReguiredMixin, View):
    """用户中心 订单页"""

    def get(self, request, page):
        "显示"
        # 获取用户的订单信息
        user = request.user
        orders = OrderInfo.objects.filter(user=user).order_by('-create_time')
        # print(orders)

        # 便利获取订单商品的信息
        for order in orders:
            # 根据order_id查询订单商品信息
            order_skus = OrderGoods.objects.filter(order_id=order.order_id)
            # print(order_skus)

            # 便利order_skus计算商品的小计
            for order_sku in order_skus:
                # 计算小计
                amount = order_sku.count * order_sku.price
                # 动态给order_sku增加属性amount，保存订单商品的小计
                order_sku.amount = amount
            order.status_name = OrderInfo.ORDER_STATUS[order.order_status]
            # 动态给order增加属性，保存订单商品的信息
            order.order_skus = order_skus

        # 分页
        paginator = Paginator(orders, 3)

        # 获取第page页的内容
        try:
            page = int(page)
        except Exception as e:
            page = 1

        if page > paginator.num_pages:
            page = 1

        # 获取第page页的Page实例对象
        order_page = paginator.page(page)

        # todo: 进行页码的控制，页面上最多显示5个页码
        # 1.总页数小于5页，页面上显示所有页码
        # 2.如果当前页是前3页，显示1-5页
        # 3.如果当前页是后3页，显示后5页
        # 4.其他情况，显示当前页的前2页，当前页，当前页的后2页
        num_pages = paginator.num_pages
        if num_pages < 5:
            pages = range(1, num_pages + 1)
        elif page <= 3:
            pages = range(1, 6)
        elif num_pages - page <= 2:
            pages = range(num_pages - 4, num_pages + 1)
        else:
            pages = range(page - 2, page + 3)

        # print (order_page)
        # 组织上下文
        context = {'order_page': order_page,
                   'pages': pages,
                   'page': 'order'}
        return render(request, 'user_center_order.html', context)


class AddressView(LoginReguiredMixin, View):
    """用户中心 地址页"""

    def get(self, request):
        "显示"
        # 获取登录用户对应User对象
        user = request.user
        # 获取用户的默认收货地址
        # try:
        #     address = Address.objects.get (user=user, is_default=True)
        # except Address.DoesNotExist:
        #     # 不存在默认地址
        #     address = None
        address = Address.objects.get_default_address(user)
        # 'address': address
        return render(request, 'user_center_site.html',
                      {'page': 'address', 'address': address})

    def post(self, request):
        """地址的添加"""
        # 接受数据
        receiver = request.POST.get('receiver')
        addr = request.POST.get('addr')
        zip_code = request.POST.get('zip_code')
        phone = request.POST.get('phone')
        # 校验数据
        if not all([receiver, addr, phone]):
            return render(request, 'user_center_site.html',
                          {'errmsg': '数据不完整'})
        # 校验手机号
        if not re.match(r'^1[3|4|5|7|8][0-9]{9}$', phone):
            return render(request, 'user_center_site.html',
                          {'errmsg': '手机格式不正确'})

        # 业务处理 ： 地址添加
        user = request.user
        # try:
        #     address = Address.objects.get(user=user, is_default=True)
        # except Address.DoesNotExist:
        #     # 不存在默认地址
        #     address = None
        address = Address.objects.get_default_address(user)
        if address:
            is_default = False
        else:
            is_default = True

        # 添加地址
        try:
            address = Address.objects.create(user=user,
                                             receiver=receiver,
                                             addr=addr,
                                             zip_code=zip_code,
                                             phone=phone,
                                             is_default=is_default)
        except Exception as e:
            return render(request, 'user_center_site.html',
                          {'errmsg': '新增地址失败'})

        # 响应结果, 刷新地址页面
        return redirect(reverse('user:address'))  # get请求方式
