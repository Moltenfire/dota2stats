import database, scrapper, sys

url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=%s&match_id={}"
sqlmatch = "SELECT COUNT(*) FROM matchinfo WHERE match_id={}"

sqlum = "

commands = []

def parseGame(id):
	
	if database.getDataSingle(sqlmatch.format(id)) == 0:
		#gamedetails = scrapper.getDataURL(url.format(id))['result']
		gamedetails = scrapper.getDataFile("singlematchextra.json")['result']
		
		
		
		