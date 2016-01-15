import os
from .models import Solution, Problem


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

def run_code(objFile, input_file, output_file, timeout):
	if os.path.isfile(objFile):
		if os.path.isfile(input_file):
			result = os.system('timeout ' + str(timeout) + ' ./' + objFile + ' <' + input_file + '>' + ' ' + output_file)
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

def getVerdict(solObj):
	file_name =  'solution_code.cpp'
	objName = 'Sol'
	codeFile = open(file_name, 'w')
	problem_input = str(solObj.problem_id) + '_input.txt'
	codeFile.write(solObj.code)
	codeFile.close()
	
	compile_result = compile_code(file_name, 'cpp', objName)
	

	if compile_result == 'SuccessFully compiled':
		return run_code(objName, problem_input, objName + '.txt', 1)
	else:
		return 'Compilation Error'
		

#objFile = 'GH'
#print compile_code('gh.cpp', 'cpp', objFile)
#print run_code(objFile, 'input.txt', 'output.txt', 100)

#' <' + input_file + '>' + ' ' + output_file

	

