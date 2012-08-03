import database, scrapper, sys

url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=%s&match_id={}"
sqlmatch = "SELECT COUNT(*) FROM matchinfo WHERE match_id={}"

sqlum = "INSERT INTO matchinfo VALUES(%s, %s, %s, %s, %s) ON DUPLICATE KEY UPDATE match_id=match_id"
sqlpi = "INSERT INTO players VALUES(%s, %s) ON DUPLICATE KEY UPDATE account_id=account_id"
sqlpmi = "INSERT INTO playermatchinfo (match_id, player_id, hero_id, item_0, item_1, item_2, item_3, item_4, item_5, slot, kills, deaths, assists, lasthits, denies, `level`, gold, gold_spent, gpm, xpm, hero_dmg, tower_dmg, leaver) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s) ON DUPLICATE KEY UPDATE id=id"

commands = []

def parseGame(id):

	commands = []
	
	if database.getDataSingle(sqlmatch.format(id)) == 0:
		game = scrapper.getDataURL(url.format(id))['result']
		 
		commands.append((sqlum, (game['match_id'], game['radiant_win'], game['duration'], game['starttime'], game['first_blood_time'])))
		
		for player in game['players']:
			commands.append((sqlpi, (player['account_id'], player['player_name'].encode('utf-8'))))
			

			
			commands.append((sqlpmi, (game['match_id'], player['account_id'], player['hero_id'], player['item_0'], player['item_1'], player['item_2'], player['item_3'], player['item_4'], player['item_5'], player['player_slot'], player['kills'], player['deaths'], player['assists'], player['last_hits'], player['denies'], player['level'], player['gold'], player['gold_spent'], player['gold_per_min'], player['xp_per_min'], player['hero_damage'], player['tower_damage'], player['leaver_status'])))
			
		database.updateDatabase(commands)
		
		
		