import urllib
import simplejson
import pprint as pprint

key = "D62C58BC4F6E612A1BC6294B842CB63B"
url = "https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key={0}"

data = simplejson.load(urllib.urlopen(url.format(key)))

# pp = pprint.PrettyPrinter(indent=4)

# pp.pprint(data['result']['heroes'])

hero_data = data['result']['heroes']

for i in hero_data:
	print i['id'], i['name'][14:]

