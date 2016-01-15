import datetime
from .test import getVerdict

from django.shortcuts import render
from .models import Solution, Problem
# Create your views here.

def mainView(request):
	problems = Problem.objects.all()
	context = {
		'problem' : problems
	}
	return render(request, 'index.html', context)

def probDetail(request, prob_id):
	problem = Problem.objects.get(pk = prob_id)
	context = {
		'problem' : problem
	}
	return render(request, 'prob_detail.html', context)

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
	
	sol_obj.verdict = getVerdict(sol_obj)
	sol_obj.save()
	context = {
		'problem' : problem,
		'sol_obj' : sol_obj
	}
	return render(request, 'get_result.html', context)

