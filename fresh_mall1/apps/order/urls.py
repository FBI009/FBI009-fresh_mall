from django.urls.conf import path, re_path
from .views import *

urlpatterns = [
    path (r'place', OrderPlaceView.as_view (), name='place'),  # 提交订单页面显示
    path(r'commit', OrderCommitView.as_view (), name='commit'),  # 提交创建
    path(r'pay', OrderPayView.as_view (), name='pay'),  # 订单支付
    path(r'check', CheckPayView.as_view (), name='check'),  # 查询支付订单结果
    re_path(r'comment/(?P<order_id>.+)', CommentView.as_view (), name='comment'),  # 订单评论
]
