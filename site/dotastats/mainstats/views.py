from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from mainstats.models import Uwcsplayers, Mainview, Gamelist


def index(request):
    uwcs_player_list = Mainview.objects.all()
    return render_to_response('mainstats/index.html', {'uwcs_player_list': uwcs_player_list})
    
def player(request, player_id):
    return HttpResponse("You're at the player %s." % player_id)

def game(request, match_id):
    return HttpResponse("You're at the match %s." % match_id)
    
def games(request):
    game_list = Gamelist.objects.all()[:25]
    return render_to_response('mainstats/games.html', {'game_list': game_list})
    
def games_page(request, page):
    return HttpResponse("You're at the games list page number %s." % page)
    
def add(request):
    return HttpResponse("You're at the add player page.")
    
def search(request):
    return HttpResponse("You're at the search page.")
