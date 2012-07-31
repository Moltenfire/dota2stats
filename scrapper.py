import urllib
import simplejson
import pprint as pprint

key = "D62C58BC4F6E612A1BC6294B842CB63B"
url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key={0}"

output = simplejson.load(urllib.urlopen(url.format(key)))


pp = pprint.PrettyPrinter(indent=3)

pp.pprint(output)



