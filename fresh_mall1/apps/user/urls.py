from django.urls import path, re_path
from django.contrib.auth.decorators import login_required
from .views import *

urlpatterns = [
    path(r'register', RegisterView.as_view(), name="register"),  # 注册
    path(r'login', LoginView.as_view(), name="login"),  # 登录
    re_path(r'active/(?P<token>.*)', ActiveView.as_view(), name='active'),
    # 用户激活
    path(r'logout', LogoutView.as_view(), name='logout'),  # 注销登录
    path(r'', UserInfoView.as_view(), name='user'),  # 信息页
    re_path(r'order/(?P<page>\d+)', userOrderView.as_view(), name='order'),
    # 订单页
    path(r'address', AddressView.as_view(), name='address'),  # 地址页
]
