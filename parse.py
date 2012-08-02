import scrapper, game

data = scrapper.getDataFile("singlematch.json")

for i in data['result']['matches']:
	game.parseGame(i['match_id'])

