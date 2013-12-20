
import sys
import csv
import sqlite3

'''
@summary: convert the input string to unicode value, if required
		  -- older versions of python need this --
'''
def getStringValue(value):
	if sys.version < '3':
		if type(value) is unicode:
			return value.encode('utf-8')
		else:
			return str(value)
	else:
		return str(value)
'''
@summary: gets the responses from the database and writes them to csv

'''
def generateCSV():

	# db connections, file io
	conn = sqlite3.connect('db/development.sqlite3')
	file = open('Responses.csv', 'w')
	writer = csv.writer(file)
	c = conn.cursor()	
	
	# initializations
	qidlist = []
	qlist = []
	rsidlist = []
	
	# get all the questions and their ids
	questions = c.execute ('''select id, text from questions where id >= 52 and id <= 182 order by id''')
	
	# insert the qids and questions into corresponding lists
	for q in questions:
		id, text = q
		qidlist.append(id)
		qlist.append(getStringValue(text))
		
	# add the questions to the csv as headers
	writer.writerow(['RESPONSE_SET_ID', 'ACCESS_CODE'] + qlist)
	
	# get all the response set ids and add them to a list
	response_sets = c.execute('''select distinct id from response_sets where completed_at != \'\' and survey_id = 2''')
	for rs in response_sets:
		rsidlist.append(rs[0])
	
	# iterate through the list of response set id's and add the responses to the csv
	for rsid in rsidlist:
		# initializations
		alist = []
		rlist = {}
		
		# add the response set id to the answer list
		alist.append(rsid)
		
		# get the access code and add it to the answer list
		access_code = c.execute('''select access_code from response_sets where id = ?''', [rsid])
		alist.append(access_code.fetchone()[0])
		
		# get the responses
		responses = c.execute ('''select r.question_id, r.answer_id, a.text, 
									     r.integer_value, r.float_value, r.text_value,
										 r.string_value, r.response_other 
									from responses r 
										 inner join questions q on r.question_id = q.id 
										 inner join answers a on r.answer_id = a.id
									where response_set_id = ? 
									order by r.question_id''', [rsid])
		
		# add the responses to a dictionary
		for r in responses:
			qid, aid, a, aiv, afv, atv, asv, aro = r
			
			# do some processing and get the answer text
			a = getStringValue(a).replace('String', '')
			aiv = ' ' + getStringValue(aiv).replace('None', '')
			afv = ' ' + getStringValue(afv).replace('None', '')
			atv = ' ' + getStringValue(atv).replace('None', '')
			asv = ' ' + getStringValue (asv).replace('None', '')
			aro = ' ' + getStringValue (aro).replace('None', '')
			
			answer = a + aiv + afv + atv + asv + aro
			
			
			# insert the response in the responses dictionary
			if qid in rlist:
				rlist[qid] = rlist[qid] + ',' + answer
			else:
				rlist[qid] = answer
			
		# get the list of answers from the responses dictionary and add them to a list
		# whenever a question is not answered, set the answer to 'N/A'
		for qid in qidlist:
			if qid in rlist:
				alist.append(rlist[qid])
			else:
				alist.append('N/A')
	
		# write the answers to the csv
		writer.writerow(alist)
	conn.close()
	file.close()
#===============================================================================
#
def main():
	generateCSV()

if __name__ == '__main__':
	main()
#
#===============================================================================