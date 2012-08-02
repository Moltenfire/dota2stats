import urllib
import simplejson

key = "D62C58BC4F6E612A1BC6294B842CB63B"
# url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key={0}"

def getData(url):
	output = simplejson.load(urllib.urlopen(url.format(key)))
	
	return output
