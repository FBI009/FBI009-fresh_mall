sudo docker container start elasticsearch # 启动elasticsearch
sudo docker container start storage # 启动storage
sudo docker container start tracker # 启动tracker
python3 manage.py collectstatic # 收集文件


sudo sbin/nginx # 启动nginx
ps aux | grep uwsgi # 查看进程

uwsgi --ini uwsgi.ini             # 启动
uwsgi --reload uwsgi.pid          # 重启
uwsgi --stop uwsgi.pid            # 关闭
