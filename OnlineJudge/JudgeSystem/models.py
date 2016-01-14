from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Problem(models.Model):
	name = models.CharField(max_length = 100)
	id = models.CharField(primary_key = True, max_length = 10)
	statement = models.CharField(max_length = 2000)
	def __str__(self):
		return self.id


class Solution(models.Model):
	verdicts = (
		('C', 'Compilation Error'),
		('AC', 'Accepted'),
		('WA', 'Wrong Answer'),
		('RE', 'Runtime Error'),
		('TLE', 'Time Limit Exceed')
	)


	code = models.CharField(max_length = 1000)
	problem_id = models.ForeignKey(Problem)
	submission_time = models.DateTimeField()
	id  = models.IntegerField(primary_key = True)
	verdict = models.CharField(max_length = 1, choices = verdicts)

	def __str__(self):
		return str(self.id)
