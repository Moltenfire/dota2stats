import json, urllib, sys

key = "D62C58BC4F6E612A1BC6294B842CB63B"
# url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=%s"

def getDataURL(url):
	try:
		output = json.load(urllib.urlopen(url % key))
		return output
	except:
		return None
		
	
def getDataFile(file):
	try:
		with open(file) as f:
			output = json.load(f)
			
		return output
	except:
		return None