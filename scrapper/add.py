import database, scrapper, sys

insert = "INSERT INTO uwcsplayers(id) VALUES(%s) ON DUPLICATE KEY UPDATE id=id"
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
		account = steamid - 0x0110000100000000
		commands.append((insert, (account)))

database.updateDatabase(commands)