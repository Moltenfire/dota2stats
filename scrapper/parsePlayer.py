import database, game, scrapper, sys, time

url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=%s&account_id={0}&date_min={1}&date_max={2}"
sql = "UPDATE uwcsplayers SET lastcheck=%s WHERE id=%s"


def update(id, lastcheck):

    currenttime = int(time.time())
    
    getGames(id, lastcheck, currenttime)
    database.updateDatabase([(sql, (currenttime, id))])
    
def getGames(id, mintime, maxtime):
  
    data = getData(id, mintime, maxtime)
    
    count = data['result']['total_results']
    
    for i in data['result']['matches']:
            game.parseGame(i['match_id'])
            newtime = i['start_time']

    if count > 25:
        getGames(id, mintime, newtime)

def getData(id, mintime, maxtime, tries=1):
    u = url.format(id, mintime, maxtime)
    print "Try: ", tries, "Url:", u
    data = scrapper.getDataURL(u)
    try:
        x = data['result']
        return data
    except:
        if tries < 10:
            tries += 1
            time.sleep(5)
            
            return getData(id, mintime, maxtime, tries)
        else:
            print "Unable to reach:", u
            sys.exit(1)
        
    
    