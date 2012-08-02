import database, sys

insert = "INSERT INTO uwcsplayers(id) VALUES({0}) ON DUPLICATE KEY UPDATE id={0}"
url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key={0}&steamids={0}"
commands = []

if (len(sys.argv) == 1):
	print "Please enter one or more uwcs player ids."
	sys.exit(1)
else:
	for i in sys.argv[1:]:
		commands.append(insert.format(i))
		
database.updateDatabase(commands)