from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class JudgeUser(User):
	problem_list = models.ManyToManyField('Problem')
	def __str__(self):
		return str(self.username)
	contrib_pts = models.IntegerField(default = 0)

class Problem(models.Model):
	name = models.CharField(max_length = 100)
	id = models.CharField(primary_key = True, max_length = 10)
	statement = models.CharField(max_length = 2000)
	setter = models.ForeignKey(JudgeUser, null = True)
	def __str__(self):
		return self.id



class Solution(models.Model):
	'''verdicts = (
		('C', 'Compilation Error'),
		('AC', 'Accepted'),
		('WA', 'Wrong Answer'),
		('RE', 'Runtime Error'),
		('TLE', 'Time Limit Exceed')
	)
	'''


	code = models.CharField(max_length = 1000)
	problem = models.ForeignKey(Problem)
	solver = models.ForeignKey(JudgeUser , null = True)
	penalty = models.IntegerField(default = 0)
	solved = models.BooleanField(default = 0)
	submission_time = models.DateTimeField()
	id  = models.IntegerField(primary_key = True)
	verdict = models.CharField(max_length = 100)

	def __str__(self):
		return str(self.problem)



