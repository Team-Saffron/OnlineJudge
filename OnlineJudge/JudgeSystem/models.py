from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class JudgeUser(User):
	solution_list = models.ManyToManyField('Solution', related_name = 'SolutionListOfUser')
	WA_Count = models.IntegerField(default = 1)
	TLE_Count = models.IntegerField(default = 1)
	AC_Count = models.IntegerField(default = 1)
	RE_Count = models.IntegerField(default = 1)
	CE_Count = models.IntegerField(default = 1)
	def __str__(self):
		return str(self.username)
	contrib_pts = models.IntegerField(default = 0)

class Problem(models.Model):
	class Meta:
		unique_together = (("p_id", "contest"), )
	

	name = models.CharField(max_length = 100)
	p_id = models.CharField(max_length = 10)

	statement = models.CharField(max_length = 2000)
	setter = models.ForeignKey(JudgeUser, null = True, related_name = 'SetterOfProblem')
	contest = models.ForeignKey('Contest', null = True, related_name = 'ContestOfProblem')
	sample_input = models.CharField(max_length = 200, null = True)
	sample_output = models.CharField(max_length = 200, null = True)

	comments = models.ForeignKey('BlogPost', related_name = "CommentsOnProblem", on_delete = models.CASCADE, null = True)

	def __str__(self):
		return (str(self.contest) + "/" + self.p_id)

class Solution(models.Model):
	'''
	verdicts = (
		('C', 'Compilation Error'),
		('AC', 'Accepted'),
		('WA', 'Wrong Answer'),
		('RE', 'Runtime Error'),
		('TLE', 'Time Limit Exceed')
	)
	'''


	code = models.CharField(max_length = 1000)
	problem = models.ForeignKey(Problem, related_name = 'SolutionOfProblem')
	penalty = models.IntegerField(default = 0)
	solved = models.BooleanField(default = 0)
	submission_time = models.DateTimeField()
	verdict = models.CharField(max_length = 100)

	def __str__(self):
		return str(self.problem)

class Contest(models.Model):
	user_list = models.ManyToManyField(JudgeUser, related_name = 'ContestToUser')
	start_time = models.DateTimeField()
	end_time = models.DateTimeField()
	isActive = models.BooleanField()
	administrator = models.ForeignKey(JudgeUser, related_name = 'admintoContest')
	contest_id = models.CharField(primary_key = True, max_length = 100)

	def __str__(self):
		return str(self.contest_id)	

class Comment(models.Model):
	addedby = models.ForeignKey('JudgeUser', related_name = 'commentbyUser')
	description = models.TextField(max_length = 1000)
	timestamp = models.DateTimeField()
	blogpost = models.ForeignKey('BlogPost', related_name = 'commentOnBlog')

class BlogPost(models.Model):
	heading = models.CharField(max_length = 50)
	addedby = models.ForeignKey('JudgeUser', related_name = 'postbyUser')
	description = models.TextField(max_length = 1000)
	timestamp = models.DateTimeField()
	tags = models.ManyToManyField('Tag', related_name = 'tagOfPost')

	def __str__(self):
		return str(self.heading)

class Tag(models.Model):
	tag = models.CharField(max_length = 100)
