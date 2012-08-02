import urllib
import simplejson
import MySQLdb as mdb
import sys

key = "D62C58BC4F6E612A1BC6294B842CB63B"
url = "https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key={0}"
con = None
insert = "INSERT INTO heroes(hero_id, hero_name) VALUES({0},'{1}') ON DUPLICATE KEY UPDATE hero_name='{1}'"

data = simplejson.load(urllib.urlopen(url.format(key)))


hero_data = data['result']['heroes']

try:
	con = mdb.connect('localhost', 'moltenfire', 'apple123', 'dota2');
	
	with con:
		
		cur = con.cursor()
		for i in hero_data:
			cur.execute(insert.format(i['id'], i['name'][14:]))
	
except mdb.Error, e:
  
    print "Error %d: %s" % (e.args[0],e.args[1])
    sys.exit(1)
	
finally:
	if con:
		con.close()
	


