import os
from .models import Solution, Problem

# Code to compile program

def compile_code(file_name, lang, objFile):
	
	if os.path.isfile(objFile):
		os.remove(objFile)

	if os.path.isfile(file_name):
		if lang == 'c':
			os.system('gcc -o ' + objFile + ' ' + file_name )

		if lang == 'cpp':
			os.system('g++ -o ' + objFile + ' ' + file_name )

		if os.path.isfile(objFile):
			return 'SuccessFully compiled'
		else:
			return 'Compilation Error'
	else:
		return '404! File Not Found'

#Code to run a given program

def run_code(objFile, input_file, output_file, timeout):
	if os.path.isfile(objFile):
		if os.path.isfile(input_file):
			result = os.system('timeout ' + str(timeout) + ' ./' + objFile + ' <' + input_file + '>' + ' ' + output_file)
			os.remove(objFile)
			if result == 0:
				return 'Success'
			elif result == 31744:
				return 'Time Limit Exceeded'
			else:
				return 'Runtime Error'
		else:
			return 'Input File not found'
		
	else:
		return 'Object File not found'


#Code to evaluate Correctness of answer
def checkWA(correct_file , test_file):
	test_lines = open(test_file).readlines()
	correct_lines = open(correct_file).readlines()
	#Now remove trailing spaces
	while(len(test_lines) > 0 and test_lines[-1] == "\n"):
		test_lines.pop()
	while(len(correct_lines) > 0 and correct_lines[-1] == "\n"):
		correct_lines.pop()

	if(len(test_lines) != len(correct_lines) ):
		return ("Wrong Answer")
	else:
	    for test,correct in zip(test_lines,correct_lines):
	    	if(test != correct):
	    		return ("Wrong Answer")
	    return ("Success")
	


#Code to give verdict to a solution object

def getVerdict(solObj):
	file_name =  'solution_code.cpp'
	objName = 'Sol'
	codeFile = open(file_name, 'w')
	problem_input = str(solObj.problem_id) + '_input.txt'
	codeFile.write(solObj.code)
	codeFile.close()
	
	compile_result = compile_code(file_name, 'cpp', objName)
	

	if compile_result == 'SuccessFully compiled':
		output_file = objName + '.txt'
		if ( run_code(objName, problem_input, output_file, 1) == "Success" ):
			correct_output_file = str(solObj.problem_id) + '_output.txt'
			return ( checkWA(correct_output_file,output_file) )
	else:
		return 'Compilation Error'
	