import datetime
import Jury

from django.shortcuts import render
from .models import Solution, Problem
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User, Permission
from django.core.exceptions import ObjectDoesNotExist
from django.core.urlresolvers import reverse
from django.http import HttpResponse, HttpResponseRedirect
# Create your views here.

def loginPage(request):
	context = {}
	return render(request,'login_page.html',context)

def signUp(request):
	username = request.POST['username']
	password = request.POST['password']
	email = request.POST['email_id']
	first_name = request.POST['first_name']
	last_name = request.POST['last_name']
	try:
		user = User.objects.get(username = username)
	except ObjectDoesNotExist:
		user = None
	if user is None:
		try:
			user = User.objects.get(email = email)
		except ObjectDoesNotExist:
			user = None
	if user is not None:
		context = {}
		return render(request,'login_page.html',context)
	else:
		u = User.objects.create(username = username , email = email , first_name = first_name , last_name = last_name)
		u.set_password(password)
		u.save()
		context = {}
		return render(request, 'login_page.html', context)




def mainView(request):
	username = request.POST['username']
	password = request.POST['password']
	context = {}
	user = authenticate(username = username, password = password)
	if user is not None:
		if user.is_active:
			login(request, user)
			problems = Problem.objects.all()
			context = {
			    'problem' : problems,
			    'user' : user
			}
			return render(request,'index.html',context)
		else:
			return HttpResponseRedirect(reverse('login_page'))
	else:
		return HttpResponseRedirect(reverse('login_page'))

def probDetail(request, prob_id):
      if request.user.is_authenticated():

            user = request.user
            if user.has_perm('JudgeSystem.change_solution'):
            	problem = Problem.objects.get(pk = prob_id)
            	context = {
            		'problem' : problem
            	}
            	return render(request, 'prob_detail.html', context)
            else:
                  return HttpResponseRedirect(reverse('login_page'))
      else:
            return HttpResponseRedirect(reverse('login_page'))


def submitSolution(request, prob_id):
	problem = Problem.objects.get(pk = prob_id)
	context = {
		'problem' : problem
	}
	return render(request, 'submit_solution.html', context)

def getResult(request, prob_id):
	problem = Problem.objects.get(pk = prob_id)
	str = request.POST["code_text"]

	sol_obj = Solution(code = str, problem_id = problem, submission_time = datetime.datetime.now())
	sol_obj.verdict = Jury.getVerdict(sol_obj)
	sol_obj.save()
	context = {
		'problem' : problem,
		'sol_obj' : sol_obj
	}
	return render(request, 'get_result.html', context)