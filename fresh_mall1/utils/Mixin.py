from django.contrib.auth.decorators import login_required

class LoginReguiredMixin(object):
    @classmethod
    def as_view (cls, **initkwargs):
        # 调用副类的as_view
        view = super(LoginReguiredMixin, cls).as_view(**initkwargs)
        return login_required(view)
