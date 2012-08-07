import database, scrapper, sys, time

url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=%s&match_id={0}"
sqlmatch = "SELECT COUNT(*) FROM matchinfo WHERE match_id=%s"

sqlum = "INSERT INTO matchinfo VALUES(%s, %s, %s, %s, %s) ON DUPLICATE KEY UPDATE match_id=match_id"
sqlpi = "INSERT INTO players VALUES(%s, %s) ON DUPLICATE KEY UPDATE player_name=player_name"
sqlpmi = "INSERT INTO playermatchinfo (match_id, player_id, hero_id, slot, kills, deaths, assists, lasthits, denies, `level`, gold, gold_spent, gpm, xpm, hero_dmg, tower_dmg, leaver) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s) ON DUPLICATE KEY UPDATE match_id=match_id"
sqlitem = "INSERT INTO itemplayers(match_id, player_id, item_id) VALUES(%s, %s, %s) ON DUPLICATE KEY UPDATE match_id=match_id"

sqlparse = "INSERT INTO parsingerrors(match_id) VALUES(%s) ON DUPLICATE KEY UPDATE match_id=match_id"

commands = []

def parseGame(id):

    commands = []
    
    if database.getDataSingle(sqlmatch, id) == 0:
        print "Parsing:", id
        game = getData(id)
        
        if game != None:
            
            commands.append((sqlum, (game['match_id'], game['radiant_win'], game['duration'], game['starttime'], game['first_blood_time'])))
            
            for player in game['players']:
                commands.append((sqlpi, (player['account_id'], player['player_name'].encode('utf-8'))))
                            
                commands.append((sqlpmi, (game['match_id'], player['account_id'], player['hero_id'], player['player_slot'], player['kills'], player['deaths'], player['assists'], player['last_hits'], player['denies'], player['level'], player['gold'], player['gold_spent'], player['gold_per_min'], player['xp_per_min'], player['hero_damage'], player['tower_damage'], player['leaver_status'])))
                
                for i in [player['item_0'], player['item_1'], player['item_2'], player['item_3'], player['item_4'], player['item_5']]:
                    if i != 0:
                        commands.append((sqlitem, (game['match_id'], player['account_id'], i)))
                
                
            database.updateDatabase(commands)
 

def getData(id, tries=1):
    u = url.format(id)
    print "Try: ", tries, "Url:", u
    data = scrapper.getDataURL(u)
    try:
        x = data['result']['match_id']
        return data['result']
    except:
        if tries < 10:
            tries += 1
            time.sleep(5)
            
            return getData(id, tries)
        else:
            print "Unable to reach:", u
            database.updateDatabase([(sqlparse, id)])
            return None
