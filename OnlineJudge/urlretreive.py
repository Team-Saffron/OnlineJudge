import urllib2
import pymysql
import datetime
from django.utils import timezone

from bs4 import BeautifulSoup

def createIO(pid, input, output):
	inFile = str(pid) + '_input.txt'
	outFile = str(pid) + '_output.txt'

	inFile = open(inFile, 'w')
	inFile.write(input)
	inFile.close()

	outFile = open(outFile, 'w')
	outFile.write(output)
	outFile.close()

conn = pymysql.connect(
	host='localhost',
    user='root',
    password='abhishek1408',
    db='OnlineJudge',
    autocommit='True',
	)


response = urllib2.urlopen("http://www.spoj.com/problems/classical/sort=0,start=100")
page_source = response.read()
soup = BeautifulSoup(page_source, "lxml")
allSpan = soup.find_all('span', {"class": "options-box"})
allProbLinks = []
for span in allSpan:
	allProbLinks.append('http://www.spoj.com' + span.previous_sibling.previous_sibling['href'])
dataList = []
i = 0;
#problem = allProbLinks[0]
conn.cursor().execute("DELETE FROM JudgeSystem_solution")
conn.cursor().execute("DELETE FROM JudgeSystem_problem")
conn.cursor().execute("ALTER TABLE JudgeSystem_problem AUTO_INCREMENT = 1")
#conn.cursor().execute("DELETE FROM JudgeSystem_blogpost")
conn.cursor().execute("ALTER TABLE JudgeSystem_solution AUTO_INCREMENT=1")
#conn.cursor().execute("ALTER TABLE JudgeSystem_blogpost AUTO_INCREMENT=1")
Bid = 0
for problem in allProbLinks:
	response = urllib2.urlopen(problem)
	page_source = response.read()
	soup = BeautifulSoup(page_source, "lxml")
	problem_id = problem[29:] 
	problem_name = soup.find('h2', {"id": "problem-name"}).string
	desc = soup.find('div', {"id": "problem-body"})
	desc = desc.contents
	# id of problem and blogpost
	
	problem_desc = str(desc[1])
	preTag = soup.find_all('pre')
	if len(preTag) == 1:
		preTag = preTag[len(preTag)-1]
		if preTag != None:
			if len(preTag.contents) < 4:
				continue
			input = preTag.contents[1].string
			output = preTag.contents[3].string


		dataelement = {
			"id" : problem_id,
			"problem_name" : problem_name,
			"problem_desc" : problem_desc,
			"input" : input,
			"output" : output, 
		}
		
		with conn.cursor() as cursor:
			Bid = Bid + 1
			query = "INSERT INTO JudgeSystem_problem (name, p_id, statement, sample_input, sample_output, contest_id, setter_id, comments_id) VALUES (%s, %s, %s, %s, %s, 'Practice', 1, %s)" 
			blogPostQuery = "INSERT INTO JudgeSystem_blogpost (heading, addedby_id, timestamp) VALUES (%s, 1, NOW())" 
			cursor.execute(blogPostQuery, (problem_name))
			print Bid
			cursor.execute(query, (problem_name, problem_id, problem_desc, input, output, (Bid)))
			createIO(Bid, input, output)


		dataList.append(dataelement)

conn.close()

print dataList

