import database, parsePlayer

select = "SELECT id, lastCheck FROM uwcsplayers"

players = database.getData(select)

for i in players:
	parsePlayer.update(i[0], i[1])