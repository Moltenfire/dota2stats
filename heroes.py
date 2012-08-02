import database, scrapper, sys

url = "https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key=%s"
insert = "INSERT INTO heroes(hero_id, hero_name) VALUES(%s,'%s') ON DUPLICATE KEY UPDATE hero_name=hero_name"
commands = []

data = scrapper.getDataURL(url)

hero_data = data['result']['heroes']

if hero_data == None:
	sys.exit(1)

for i in hero_data:
	commands.append(insert % (i['id'], i['name'][14:]))

database.updateDatabase(commands)