import MySQLdb as mdb, sys

def updateDatabase(commands):

	con = None

	try:
		con = mdb.connect('localhost', 'moltenfire', 'apple123', 'dota2', use_unicode=True, charset='utf8');
		
		with con:
			
			cur = con.cursor()
			for i in commands:
				cur.execute(i[0], i[1])
			
		
	except mdb.Error, e:
	  
		print "Error %d: %s" % (e.args[0],e.args[1])
		sys.exit(1)
		
	finally:
		if con:
			con.close()
			
def getData(command, values):
	
	con = None
	
	try:
		con = mdb.connect('localhost', 'moltenfire', 'apple123', 'dota2');
		
		with con:
			
			cur = con.cursor()
			cur.execute(command, values)
			
			rows = cur.fetchall()
			
			return rows
				
	except mdb.Error, e:
	  
		print "Error %d: %s" % (e.args[0],e.args[1])
		sys.exit(1)
		
	finally:
		if con:
			con.close()
			
def getDataSingle(command, values):
	
	con = None
	
	try:
		con = mdb.connect('localhost', 'moltenfire', 'apple123', 'dota2');
		
		with con:
			
			cur = con.cursor()
			cur.execute(command, values)
			
			rows = cur.fetchone()
			
			return rows[0]
				
	except mdb.Error, e:
	  
		print "Error %d: %s" % (e.args[0],e.args[1])
		sys.exit(1)
		
	finally:
		if con:
			con.close()
