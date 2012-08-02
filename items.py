import database, scrapper, sys

file = "items.json"
insert = "INSERT INTO items(item_id, item_name) VALUES({0},'{1}') ON DUPLICATE KEY UPDATE item_name='{1}'"
commands = []

data = scrapper.getDataFile(file)

item_data = data['result']['items']

if item_data == None:
	sys.exit(1)

for i in item_data:
	commands.append(insert.format(i['id'], i['name']))

database.updateDatabase(commands)