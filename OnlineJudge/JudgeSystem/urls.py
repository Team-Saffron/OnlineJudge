"""OnlineJudge URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from . import views
#app_name = 'JudgeSystem'
urlpatterns = [
    url(r'^index/', views.mainView, name = 'index'),
    url(r'^submissions/(?P<solution_id>([0-9])+)/', views.printSolution, name = 'print_solution'),
    url(r'^problem/(?P<prob_id>([0-9]|[a-z]|[A-Z])+)/', views.probDetail, name = 'details'),
    url(r'^submit/(?P<prob_id>([0-9]|[a-z]|[A-Z])+)/', views.submitSolution, name = 'submit_code'),
    url(r'^result/(?P<prob_id>([0-9]|[a-z]|[A-Z])+)/', views.getResult, name = 'results'),
    url(r'^login/', views.loginPage, name = 'login_page'),
    url(r'^signUp/', views.signUp, name = 'sign_up'),
    url(r'^addProblem/', views.addProblem, name = 'add_problem'),
     url(r'^users/all/', views.allUsers, name = 'userlist'),
    url(r'^users/(?P<username>([0-9]|[a-z]|[A-Z])+)/', views.userProfile, name = 'user_profile'),

]
