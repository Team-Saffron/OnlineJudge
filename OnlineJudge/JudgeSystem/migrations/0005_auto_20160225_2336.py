# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-02-25 18:06
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('JudgeSystem', '0004_auto_20160121_2020'),
    ]

    operations = [
        migrations.AddField(
            model_name='problem',
            name='sample_input',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='problem',
            name='sample_output',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='judgeuser',
            name='solution_list',
            field=models.ManyToManyField(related_name='SolutionListOfUser', to='JudgeSystem.Solution'),
        ),
        migrations.AlterField(
            model_name='problem',
            name='setter',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='SetterOfProblem', to='JudgeSystem.JudgeUser'),
        ),
    ]