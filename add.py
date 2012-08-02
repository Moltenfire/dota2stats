import database, scrapper, sys

insert = "INSERT INTO uwcsplayers(id, steamid, name) VALUES({0}, {1}, '{2}') ON DUPLICATE KEY UPDATE name='{2}'"
url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=%s&steamids="
commands = []

if (len(sys.argv) == 1):
	print "Please enter one or more uwcs 64-bit SteamIDs."
	sys.exit(1)
else:
	for i in sys.argv[1:]:
		url = ''.join([url, i, ','])

	userdata = scrapper.getDataURL(url)
	for i in userdata['response']['players']:
		name = i['personaname']
		steamid = int(i['steamid'])
		account = steamid - 0x0110000100000000
		commands.append(insert.format(account, steamid, name))

database.updateDatabase(commands)