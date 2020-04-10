from django.urls import path, include
import user.views
urlpatterns = [
    path('<str:username>/',user.views.display),
    path('<str:username>/login/',user.views.login),
    path('<str:username>/quit/',user.views.login),
]