# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class Heroes(models.Model):
    hero_id = models.IntegerField(primary_key=True)
    hero_name = models.CharField(max_length=180)
    class Meta:
        db_table = u'heroes'

class Items(models.Model):
    item_id = models.IntegerField(primary_key=True)
    item_name = models.CharField(max_length=180)
    class Meta:
        db_table = u'items'
        
class Players(models.Model):
    account_id = models.IntegerField(primary_key=True)
    player_name = models.CharField(max_length=300)
    class Meta:
        db_table = u'players'
        
class Matchinfo(models.Model):
    match_id = models.IntegerField(primary_key=True)
    radiant_win = models.IntegerField()
    duration = models.IntegerField()
    start_time = models.IntegerField()
    first_blood = models.IntegerField()
    class Meta:
        db_table = u'matchinfo'

class Uwcsplayers(models.Model):
    id = models.IntegerField(primary_key=True)
    lastcheck = models.IntegerField()
    class Meta:
        db_table = u'uwcsplayers'

class Playermatchinfo(models.Model):
    id = models.IntegerField(primary_key=True)
    match = models.ForeignKey(Matchinfo)
    player = models.ForeignKey(Players)
    hero = models.ForeignKey(Heroes)
    slot = models.IntegerField()
    kills = models.IntegerField()
    deaths = models.IntegerField()
    assists = models.IntegerField()
    lasthits = models.IntegerField()
    denies = models.IntegerField()
    level = models.IntegerField()
    gold = models.IntegerField()
    gold_spent = models.IntegerField()
    gpm = models.IntegerField()
    xpm = models.IntegerField()
    hero_dmg = models.IntegerField()
    tower_dmg = models.IntegerField()
    leaver = models.IntegerField()
    class Meta:
        db_table = u'playermatchinfo'
        ordering = ['slot']
        
class Playermatchdata(models.Model):
    id = models.IntegerField(primary_key=True)
    match_id = models.IntegerField()
    player_id = models.IntegerField()
    name = models.CharField(max_length=300)
    hero_name = models.CharField(max_length=180)
    slot = models.IntegerField()
    kills = models.IntegerField()
    deaths = models.IntegerField()
    assists = models.IntegerField()
    lasthits = models.IntegerField()
    denies = models.IntegerField()
    level = models.IntegerField()
    gpm = models.IntegerField()
    xpm = models.IntegerField()
    leaver = models.IntegerField()
    class Meta:
        db_table = u'playermatchdata'
        ordering = ['slot']
        
class Itemplayers(models.Model):
    id = models.IntegerField(primary_key=True)
    match = models.ForeignKey(Matchinfo)
    player = models.ForeignKey(Players)
    item = models.ForeignKey(Items)
    class Meta:
        db_table = u'itemplayers'
        
class Parsingerrors(models.Model):
    match_id = models.IntegerField(primary_key=True)
    class Meta:
        db_table = u'parsingerrors'

class Matchdata(models.Model):
    match_id = models.IntegerField()
    player_id = models.IntegerField()
    hero_id = models.IntegerField()
    slot = models.IntegerField()
    kills = models.IntegerField()
    deaths = models.IntegerField()
    assists = models.IntegerField()
    lasthits = models.IntegerField()
    denies = models.IntegerField()
    level = models.IntegerField()
    gold = models.IntegerField()
    gold_spent = models.IntegerField()
    gpm = models.IntegerField()
    xpm = models.IntegerField()
    hero_dmg = models.IntegerField()
    tower_dmg = models.IntegerField()
    leaver = models.IntegerField()
    player_name = models.CharField(max_length=300)
    hero_name = models.CharField(max_length=180)
    class Meta:
        db_table = u'matchdata'
        
class Mainview(models.Model):
    name = models.CharField(max_length=300)
    account_id = models.IntegerField(primary_key=True)
    wins = models.DecimalField(null=True, max_digits=27, decimal_places=0, blank=True)
    games = models.BigIntegerField()
    perc = models.DecimalField(null=True, max_digits=35, decimal_places=3, blank=True)
    avg_kills = models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)
    avg_deaths = models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)
    avg_assists = models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)
    class Meta:
        db_table = u'mainview'

class Gamelist(models.Model):
    match_id = models.IntegerField(primary_key=True)
    starttime = models.CharField(max_length=57, blank=True)
    mins = models.BigIntegerField(null=True, blank=True)
    sec = models.BigIntegerField(null=True, blank=True)
    class Meta:
        db_table = u'gamelist'
        
class Matchdataitems(models.Model):
    id = models.IntegerField(primary_key=True)
    match_id = models.IntegerField()
    player_id = models.IntegerField()
    slot = models.IntegerField()
    name = models.CharField(max_length=180)
    class Meta:
        db_table = u'matchdataitems'
        ordering = ['slot']
        
class Playerview(models.Model):
    name = models.CharField(max_length=300)
    account_id = models.IntegerField(primary_key=True)
    wins = models.DecimalField(null=True, max_digits=27, decimal_places=0, blank=True)
    games = models.BigIntegerField()
    kills = models.DecimalField(null=True, max_digits=28, decimal_places=0, blank=True)
    deaths = models.DecimalField(null=True, max_digits=28, decimal_places=0, blank=True)
    assists = models.DecimalField(null=True, max_digits=28, decimal_places=0, blank=True)
    lasthits = models.DecimalField(null=True, max_digits=31, decimal_places=0, blank=True)
    denies = models.DecimalField(null=True, max_digits=31, decimal_places=0, blank=True)
    gpm = models.DecimalField(null=True, max_digits=7, decimal_places=0, blank=True)
    xpm = models.DecimalField(null=True, max_digits=7, decimal_places=0, blank=True)
    class Meta:
        db_table = u'playerview'
        
class Playergamedetails(models.Model):
    id = models.IntegerField(primary_key=True)
    match_id = models.IntegerField()
    player_id = models.IntegerField()
    name = models.CharField(max_length=300)
    hero_name = models.CharField(max_length=180)
    slot = models.IntegerField()
    kills = models.IntegerField()
    deaths = models.IntegerField()
    assists = models.IntegerField()
    lasthits = models.IntegerField()
    denies = models.IntegerField()
    level = models.IntegerField()
    gpm = models.IntegerField()
    xpm = models.IntegerField()
    leaver = models.IntegerField()
    starttime = models.CharField(max_length=57, blank=True)
    class Meta:
        db_table = u'playergamedetails'