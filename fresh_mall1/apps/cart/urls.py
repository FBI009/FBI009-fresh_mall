from django.urls.conf import path
from .views import *
urlpatterns = [
    path(r'add', CartAddView.as_view(), name='add'), # 购物车添加记录
    path(r'', CartInfoView.as_view(), name='show'), # 购物车页面显示
    path (r'update', CartUpdateView.as_view (), name='update'),  # 购物车记录更新
    path (r'delete', CartDeleteView.as_view (), name='delete'),  # 购物车记录删除
]