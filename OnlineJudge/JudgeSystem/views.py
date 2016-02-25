import datetime
import Jury
import dateutil.parser; 
from django.shortcuts import render
from .models import Solution, Problem, JudgeUser, Contest
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User, Permission
from django.core.exceptions import ObjectDoesNotExist
from django.core.urlresolvers import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.utils import timezone


# Create your views here.

def loginPage(request):

	context = {
		'someInfo' : False,
	}
	if request.is_ajax():
		print "Hello"
		context = {
			'someInfo' : True,
			'data' : 'So! here'
		}
	return render(request,'login_page.html',context)

def signUp(request):
	username = request.POST['username']
	password = request.POST['password']
	email = request.POST['email_id']
	first_name = request.POST['first_name']
	last_name = request.POST['last_name']
	if username == "" or password == "" or email == "" or first_name == "":
		context = {
			"message" : "Can't Signup! Username, Password, email or First Name can't be empty!"
		}
		return render(request, 'show_message.html', context)


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
		context = {
			"message" : "User with this username or email already exists"
		}
		return render(request, 'show_message.html', context)
	else:
		u = JudgeUser.objects.create(username = username , email = email , first_name = first_name , last_name = last_name)
		u.set_password(password)
		permission = Permission.objects.get(codename = 'change_solution')
		u.user_permissions.add(permission)
		u.save()
		contest = Contest.objects.get(contest_id = 'Practice')
		contest.user_list.add(u)
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
			    'user' : user,
			    'users' : JudgeUser.objects.all(),
			}
			return render(request,'index.html',context)
		else:
			return HttpResponseRedirect(reverse('login_page'))



def probDetail(request, prob_id, contest_id):
	print prob_id
	if request.user.is_authenticated():
            user = request.user
            if user.has_perm('JudgeSystem.change_solution'):
            	user = JudgeUser.objects.get(username = user.username)
            	contest = Contest.objects.get(pk = contest_id)
            	problem = Problem.objects.filter(p_id = prob_id).get(contest = contest)
            	try:
            		sol_obj = (user.solution_list).get(problem = problem)
            		sol_id = sol_obj.id
            	except:
            		sol_obj = None
            		sol_id = 0
            	context = {
            		'problem' : problem,
            		'user' : request.user,
            		'sol_id' : sol_id,
            		'users' : JudgeUser.objects.all(),
            		'sol_obj' : sol_obj,
            	}
            	return render(request, 'prob_detail.html', context)
            else:
                return HttpResponseRedirect(reverse('login_page'))
	else:
            return HttpResponseRedirect(reverse('login_page'))
def practiceProbDetail(request, prob_id):
	return HttpResponseRedirect(reverse('details', args = ['Practice', prob_id]))

def submitSolution(request, prob_id):
	problem = Problem.objects.get(pk = prob_id)
	current_user = JudgeUser.objects.get(username = request.user.username)
	cur_time = timezone.now()
	#Checking if user is registered or not
	registered = problem.contest.user_list.filter(username = current_user.username).count()

	if problem.contest.start_time > cur_time:
		context = {
			"message" : 'Contest Hasn\'t Started Yet'
		}
		return render(request, 'show_message.html', context)
	elif problem.contest.end_time < cur_time:
		context = {
			"message" : 'Sorry! Contest has ended'
		}
		return render(request, 'show_message.html', context)
	elif registered == 0:
		context = {
			"message" : 'Please Register First'
		}
		return render(request, 'show_message.html', context)

	context = {
		'problem' : problem
	}


	return render(request, 'submit_solution.html', context)


def getResult(request, prob_id):
	print prob_id
	problem = Problem.objects.get(pk = prob_id)
	print problem.p_id 
	Str = request.POST["code_text"]
	solver = request.user
	solver = JudgeUser.objects.get(username = solver.username)

	try:
		sol_obj = (solver.solution_list).get(problem = problem)
	except:
		sol_obj = None


	if sol_obj is None:
		bug = "1"
		sol_obj = Solution(code = Str, problem = problem, submission_time = datetime.datetime.now())
		
	else:
		bug = "2"
		print sol_obj.code
		sol_obj.code = Str
		sol_obj.submission_time = datetime.datetime.now()

	sol_obj.verdict = Jury.getVerdict(sol_obj)

	
	if sol_obj.verdict == "Success":
		sol_obj.solved = 1
	elif sol_obj.solved != 1:
		sol_obj.penalty = sol_obj.penalty + 1

	sol_obj.save()
	solver.solution_list.add(Solution.objects.last())

	context = {
		'problem' : problem,
		'sol_obj' : sol_obj,
		'solver' : solver,
		'bug' : bug
	}
	return render(request, 'get_result.html', context)


def addProblem(request, contest_id):
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
			sample_input = request.POST["Sinput"]
			sample_output = request.POST["Soutput"]
			contest_name = request.POST["contest_name"]

			contest = Contest.objects.get(pk = contest_name)

			#Created New Problem

			newProblem = Problem(name = prob_name, p_id = prob_id, statement = statement, setter = U, contest = contest, sample_input = sample_input, sample_output = sample_output)
			newProblem.save()

			#Save Correct input and output
			Jury.createIO(newProblem, input_data, output_data) 
		else:
			return HttpResponseRedirect(reverse('login_page'))	

	context = {
		'user' : U,
		'contest_name' : contest_id
	}
	return render(request, 'add_problem.html', context)


def allUsers(request):
	context = {
		"users" : JudgeUser.objects.all()
	}
	return render(request, 'userlist.html',context)


def userProfile(request, username):
	try:
		U = JudgeUser.objects.get(username = username)
	except ObjectDoesNotExist:
		U = None
	if U is None:
		context = {

		}
		return render(request, 'pagenotfound.html', context)
	addList = Problem.objects.filter(setter = U).all()
	curUser = request.user
	context = {
		"user" : U,
		"cuser" : curUser,
		"tryList" : U.solution_list.all(),
		"addList" : addList,
		"users" : JudgeUser.objects.all(),
	}

	return render(request, 'userprofile.html', context)


def printSolution(request, solution_id):
	try:
		sol_obj = Solution.objects.get(id = solution_id)
	except:
		sol_obj = None
	context = {
	    "sol_obj" : sol_obj
	}
	return render(request, 'printsolution.html', context)


def showContest(request, contest_id):
	context = {

	}
	try:
		contest = Contest.objects.get(pk = contest_id)
	except:
		contest = None
	if contest == None:
		return render(request, 'pagenotfound.html', context)
	cur_time = timezone.now()
	context = {
		"message" : 'Contest Hasn\'t Started Yet'
	}

	if cur_time < contest.start_time:
		return render(request, 'show_message.html', context)
	current_user = JudgeUser.objects.get(username = request.user.username)
	

	if current_user == contest.administrator:
		isAdmin = True
	else:
		isAdmin = False

 	context = {
		"contest" : contest,
		"users" : JudgeUser.objects.all(),
		"user_list" : contest.user_list.all(),
		"problem_list" : Problem.objects.filter(contest = contest),
		"cur_time" : datetime.datetime.now(),
		"tot_time" : contest.end_time - cur_time, 
		"is_admin" : isAdmin,
	}
	return render(request, 'contest_details.html', context)

def showAllContests(request):
	
	context = {
		"contests" : Contest.objects.all(),
		"users" : JudgeUser.objects.all(),
	}
	return render(request, 'show_all_contests.html', context)

def registerForContest(request, contest_id):
	print "Hell!!"
	current_user = JudgeUser.objects.get(username = request.user.username)
	contest = Contest.objects.get(contest_id = contest_id)
	contest.user_list.add(current_user)
	return HttpResponseRedirect(reverse('ContestDetails', args = [contest_id,]))

def createContest(request):
	u = request.user
	try:
		u = JudgeUser.objects.get(username = u.username)
	except:
		u = None
	if u is None:
		return HttpResponseRedirect(reverse('login_page'))
	if u.is_authenticated():
		if request.method =='POST':
			contest_id = request.POST["contest_id"]
			try:
				contest = Contest.objects.get(pk = contest_id)
			except:
				contest = None
			if contest is not None:
				error = 0
				context={
					"error":error
				}
				return render(request,'creation_result.html',context)
			contest = Contest(contest_id = contest_id, isActive = False)


			start_time = request.POST["start_time"]
			contest.start_time = dateutil.parser.parse(start_time)
			end_time = request.POST["end_time"]
			contest.end_time = dateutil.parser.parse(end_time)
			admin = u
			contest.administrator = u
			#contest = Contest(contest_id = contest_id, start_time = start_time, end_time = end_time, administrator = admin)
			contest.save()
			error = 1
			context={ "error" : error}
			return render(request,'creation_result.html',context)
		else:
			context={
				"user" : u,
			}
			return render(request,'create_contest.html',context)
	else:
		return HttpResponseRedirect(reverse('login_page'))


def extendContest(request, contest_id):
	if request.method == 'POST':
		contest = Contest.objects.get(pk = contest_id)
		contest.end_time = dateutil.parser.parse(request.POST["new_end_time"])
		contest.save()
		return HttpResponseRedirect(reverse('ContestDetails', args = [contest_id,]))
	else:
		context={
			"contest_id":contest_id
		}
		return render(request, 'extend_contest.html', context)


class RankTable:
	def __init__(self):
		self.username = ""
		self.solved_prob = 0
		self.penalty = 0

def compare(left , right):
	if left.solved_prob == right.solved_prob:
		return (left.penalty - right.penalty)

	else:
		return (right.solved_prob - left.solved_prob)


def getRanklist(request, contest_id):


	try:
		contest = Contest.objects.get(pk = contest_id)
	except:
		contest = None
	context = {}
	if contest is None:
		return render(request, 'pagenotfound.html', context)

	user_list = contest.user_list.all()
	rankList = []

	for user in user_list:
		newUser = RankTable()
		newUser.username = user.username
		username = user.username
		sol_list = user.solution_list.all()
		for sol in sol_list:
			prob = sol.problem
			if prob.contest == contest and sol.solved == True:
				newUser.solved_prob = newUser.solved_prob + 1
				newUser.penalty = newUser.penalty + sol.penalty
		rankList.append(newUser)

	rankList = sorted(rankList, cmp = compare)

	context = {
		"contest" : contest,
		"rankList" : rankList,
	}
	return render(request, 'get_ranklist.html', context)

def logout_view(request):
	print "hello!"
	logout(request)
	
	return HttpResponseRedirect(reverse('login_page'))

def fbtest(request):
	context = {

	}
	return render(request, 'fbtest.html', context)