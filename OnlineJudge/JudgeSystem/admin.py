from django.contrib import admin
from .models import Problem, Solution, JudgeUser, Contest
# Register your models here.

admin.site.register(Problem)
admin.site.register(Solution)
admin.site.register(JudgeUser)
admin.site.register(Contest)