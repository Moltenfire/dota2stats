from django.conf.urls import patterns, include, url

urlpatterns = patterns('mainstats.views',
    url(r'^$', 'index'),
    url(r'^main/$', 'index'),
    url(r'^player/(?P<player_id>\d+)/$', 'player_noid'),
    url(r'^player/(?P<player_id>\d+)/(?P<page>\d+)/$', 'player'),
    url(r'^game/(?P<id>\d+)/$', 'game'),
    url(r'^games/$', 'games'),
    url(r'^games/(?P<page>\d+)/$', 'games_page'),    
    url(r'^add/$', 'add'),
    url(r'^search/$', 'search'),
    url(r'^search/results/$', 'search_results'),
)
