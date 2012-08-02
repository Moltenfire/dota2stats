import scrapper, me

interval = 86400
url = ""

def update(id, lastcheck):
	currenttime = int(time.time())
	difference = currenttime - lastcheck
	
	i = 0
	if difference > interval:
		while lastcheck < currenttime:
			parseGames(id, lastcheck, lastcheck + interval, currenttime)
			lastcheck += interval
			i += 1
	else:
		getGames(id, lastcheck, currenttime, currenttime)

	print i
		
def getGames(id, mintime, maxtime, currenttime, currenttime):
	pass
	