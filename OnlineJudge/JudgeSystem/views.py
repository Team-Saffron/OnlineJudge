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

def submitSolution(request,prob_id):
	problem = Problem.objects.get(pk = prob_id)
	context = {
		'problem' : problem
	}
	return render(request, 'submit_solution.html', context)

