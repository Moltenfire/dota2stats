from django.http import HttpResponse, Http404
from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
from mainstats.models import Uwcsplayers, Mainview, Gamelist, Matchinfo, Playermatchdata, Matchdataitems, Playerview, Playergamedetails, Searchplayers
from django.template import RequestContext
from math import ceil
import datetime


def index(request):
    uwcs_player_list = Mainview.objects.all()    
    return render_to_response('mainstats/index.html', {'uwcs_player_list': uwcs_player_list})

    
def player_noid(request, player_id):
    return player(request, player_id, 0)
    
def player(request, player_id, page):
    num_pages = 10
    
    try:
        x = int(page)
    except:
        raise Http404

    playerdata = get_object_or_404(Playerview, account_id=player_id)
    gamedata = get_list_or_404(Playergamedetails, player_id=player_id)
    items = list(Matchdataitems.objects.filter(player_id=player_id))
    
    total = len(gamedata)
    low = x * num_pages
    high = low + num_pages
    if high > total:
        high = total
    selected = gamedata[low:high]
    
    prev = x - 1 if x > 0 else 0 
    
    last = int(ceil((total / num_pages)))
    
    next = x + 1 if x < last else last
    
    return render_to_response('mainstats/player.html', {'player': playerdata, 'games': selected, 'items': items, 'total': total, 'min': low+1, 'max': high, 'prev': prev, 'last': last, 'next': next})

def game(request, id):
    # Match_id, Start TIme, Duration, First blood time, Winner
    
    matchdata = get_object_or_404(Matchinfo, match_id=id)
    playerdata = get_list_or_404(Playermatchdata, match_id=id)
    items = list(Matchdataitems.objects.filter(match_id=id))
    
    start = datetime.datetime.fromtimestamp(matchdata.start_time).strftime('%d-%m-%Y %H:%M:%S')    
    
    radiant = playerdata[:5]    
    dire = playerdata[5:]
    
    return render_to_response('mainstats/game.html', {'matchdata': matchdata, 'start': start, 'radiant': radiant, 'dire': dire, 'items': items})
    
def games(request):
    return games_page(request, 0)
    
def games_page(request, page):
    num_pages = 25
    
    try:
        x = int(page)
    except:
        raise Http404
    game_list = Gamelist.objects.all()
    total = len(game_list)
    low = x * num_pages
    high = low + num_pages
    if high > total:
        high = total
    selected = game_list[low:high] 
    
    prev = x - 1 if x > 0 else 0 
    
    last = int(ceil((total / num_pages)))
    
    next = x + 1 if x < last else last
    
    
    return render_to_response('mainstats/games.html', {'game_list': selected, 'total': total, 'min': low+1, 'max': high, 'prev': prev, 'last': last, 'next': next})
    
def add(request):
    return render_to_response('mainstats/add.html')
    
def search(request):
    return render_to_response('mainstats/search.html', {}, context_instance=RequestContext(request))
    
def search_results(request):
    try:
        search = request.POST['search_term']
        results = get_list_or_404(Searchplayers, name__icontains=search)
    except:
        return render_to_response('mainstats/search.html', {'error_message': "Error when performing search."}, context_instance=RequestContext(request))
        
    
    return render_to_response('mainstats/search.html', {'results': results, 'search_term': request.POST['search_term']}, context_instance=RequestContext(request))







    