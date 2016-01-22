import datetime
import Jury

from django.shortcuts import render
from .models import Solution, Problem, JudgeUser
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
		return HttpResponseRedirect(reverse('login_page'))
	else:
		u = JudgeUser.objects.create(username = username , email = email , first_name = first_name , last_name = last_name)
		u.set_password(password)
		permission = Permission.objects.get(codename = 'change_solution')
		u.user_permissions.add(permission)
		u.save()
		context = {}
		return HttpResponseRedirect(reverse('login_page'))


def mainView(request):
	if request.method == 'POST':
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
	else:
		user = request.user
		if user.is_authenticated():
			problems = Problem.objects.all()
			context = {
			    'problem' : problems,
			    'user' : user
			}
			return render(request,'index.html',context)
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
	solver = request.user
	solver = JudgeUser.objects.get(username = solver.username)

	try:
		sol_obj = (solver.solution_list).get(problem_id = problem)
	except:
		sol_obj = None
	if sol_obj is None:
		bug="1"
		sol_obj = Solution(code = str, problem_id = problem, submission_time = datetime.datetime.now())
		sol_obj.save()
		solver.solution_list.add(Solution.objects.last())
	else:
		bug="2"
		sol_obj.code = str
		sol_obj.submission_time = datetime.datetime.now()

	sol_obj.verdict = Jury.getVerdict(sol_obj)
	
	if sol_obj.verdict == "Success":
		sol_obj.solved = 1
	elif sol_obj.solved != 1:
		sol_obj.penalty = sol_obj.penalty + 1
	sol_obj.save()

	context = {
		'problem' : problem,
		'sol_obj' : sol_obj,
		'solver' : solver,
		'bug' : bug
	}
	return render(request, 'get_result.html', context)

def addProblem(request):
	U = request.user
	try:
		U = JudgeUser.objects.get(username = U.username)
	except:
		U = None

	if U is None:
		return HttpResponseRedirect(reverse('login_page'))


	if request.method == 'POST':
		if U.is_authenticated():
			prob_id = request.POST["prob_id"]
			prob_name = request.POST["prob_name"]
			statement = request.POST["statement"]
			input_data = request.POST["input"]
			output_data = request.POST["output"]

			#Created New Problem

			newProblem = Problem(name = prob_name, id = prob_id, statement = statement, setter = U)
			newProblem.save()

			#Save Correct input and output
			Jury.createIO(newProblem, input_data, output_data) 
		else:
			return HttpResponseRedirect(reverse('login_page'))	


	context = {
		'user' : U
	}
	return render(request, 'add_problem.html', context)
