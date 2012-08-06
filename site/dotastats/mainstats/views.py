from django.http import HttpResponse, Http404
from django.shortcuts import render_to_response, get_object_or_404
from mainstats.models import Uwcsplayers, Mainview, Gamelist
from math import ceil


def index(request):
    uwcs_player_list = Mainview.objects.all()
    return render_to_response('mainstats/index.html', {'uwcs_player_list': uwcs_player_list})
    
def player(request, player_id):
    return HttpResponse("You're at the player %s." % player_id)

def game(request, match_id):
    return HttpResponse("You're at the match %s." % match_id)
    
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
    return HttpResponse("You're at the add player page.")
    
def search(request):
    return HttpResponse("You're at the search page.")