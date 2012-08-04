import database, game, scrapper, sys, time

url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=%s&account_id={}&date_min={}&date_max={}"
sql = "UPDATE uwcsplayers SET lastCheck=%s WHERE id=%s"
games = []

def update(id, lastcheck):

	games = []
	currenttime = int(time.time())
	
	getGames(id, lastcheck, currenttime)
	database.updateDatabase([(sql, (currenttime, id))])
	
def getGames(id, mintime, maxtime):
	data = scrapper.getDataURL(url.format(id, mintime, maxtime))
	
	if data != None:
		count = data['result']['total_results']

		if count > 25:
			for i in data['result']['matches']:
				games.append(i['match_id'])
				newtime = i['start_time']
				
			getGames(id, mintime, newtime)
			
		else:
			for i in data['result']['matches']:
				games.append(i['match_id'])

			
			for i in games:
				game.parseGame(i)
				
	else:
		print "No data", data
		sys.exit(1)