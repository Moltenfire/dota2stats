import MySQLdb as mdb, sys

def updateDatabase(commands):

	con = None

	try:
		con = mdb.connect('localhost', 'moltenfire', 'apple123', 'dota2');
		
		with con:
			
			cur = con.cursor()
			for i in commands:
				cur.execute(i)
			
		
	except mdb.Error, e:
	  
		print "Error %d: %s" % (e.args[0],e.args[1])
		sys.exit(1)
		
	finally:
		if con:
			con.close()