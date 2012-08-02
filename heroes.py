import database, scrapper

url = "https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key={0}"
insert = "INSERT INTO heroes(hero_id, hero_name) VALUES({0},'{1}') ON DUPLICATE KEY UPDATE hero_name='{1}'"
commands = []

data = scrapper.getDataURL(url)

hero_data = data['result']['heroes']

for i in hero_data:
	commands.append(insert.format(i['id'], i['name'][14:]))

database.updateDatabase(commands)