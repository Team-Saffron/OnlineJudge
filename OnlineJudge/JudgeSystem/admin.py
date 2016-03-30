from django.contrib import admin
from .models import Problem, Solution, JudgeUser, Contest, BlogPost, Comment, Tag
# Register your models here.

admin.site.register(Problem)
admin.site.register(Solution)
admin.site.register(JudgeUser)
admin.site.register(Tag)
admin.site.register(Contest)
admin.site.register(BlogPost)
admin.site.register(Comment)