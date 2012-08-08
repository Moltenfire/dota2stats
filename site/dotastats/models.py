# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class AuthGroup(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=240, unique=True)
    class Meta:
        db_table = u'auth_group'

class AuthGroupPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    group = models.ForeignKey(AuthGroup)
    permission = models.ForeignKey(AuthPermission)
    class Meta:
        db_table = u'auth_group_permissions'

class AuthPermission(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)
    content_type = models.ForeignKey(DjangoContentType)
    codename = models.CharField(max_length=300, unique=True)
    class Meta:
        db_table = u'auth_permission'

class AuthUser(models.Model):
    id = models.IntegerField(primary_key=True)
    username = models.CharField(max_length=90, unique=True)
    first_name = models.CharField(max_length=90)
    last_name = models.CharField(max_length=90)
    email = models.CharField(max_length=225)
    password = models.CharField(max_length=384)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    is_superuser = models.IntegerField()
    last_login = models.DateTimeField()
    date_joined = models.DateTimeField()
    class Meta:
        db_table = u'auth_user'

class AuthUserGroups(models.Model):
    id = models.IntegerField(primary_key=True)
    user = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)
    class Meta:
        db_table = u'auth_user_groups'

class AuthUserUserPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    user = models.ForeignKey(AuthUser)
    permission = models.ForeignKey(AuthPermission)
    class Meta:
        db_table = u'auth_user_user_permissions'

class DjangoAdminLog(models.Model):
    id = models.IntegerField(primary_key=True)
    action_time = models.DateTimeField()
    user = models.ForeignKey(AuthUser)
    content_type = models.ForeignKey(DjangoContentType, null=True, blank=True)
    object_id = models.TextField(blank=True)
    object_repr = models.CharField(max_length=600)
    action_flag = models.IntegerField()
    change_message = models.TextField()
    class Meta:
        db_table = u'django_admin_log'

class DjangoContentType(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=300)
    app_label = models.CharField(max_length=300, unique=True)
    model = models.CharField(max_length=300, unique=True)
    class Meta:
        db_table = u'django_content_type'

class DjangoSession(models.Model):
    session_key = models.CharField(max_length=120, primary_key=True)
    session_data = models.TextField()
    expire_date = models.DateTimeField()
    class Meta:
        db_table = u'django_session'

class Gamelist(models.Model):
    match_id = models.IntegerField()
    starttime = models.CharField(max_length=57, blank=True)
    mins = models.BigIntegerField(null=True, blank=True)
    sec = models.CharField(max_length=6, blank=True)
    class Meta:
        db_table = u'gamelist'

class Heroes(models.Model):
    hero_id = models.IntegerField(primary_key=True)
    hero_name = models.CharField(max_length=180)
    class Meta:
        db_table = u'heroes'

class Itemplayers(models.Model):
    id = models.IntegerField(primary_key=True)
    match = models.ForeignKey(Matchinfo)
    player = models.ForeignKey(Players)
    item = models.ForeignKey(Items)
    class Meta:
        db_table = u'itemplayers'

class Items(models.Model):
    item_id = models.IntegerField(primary_key=True)
    item_name = models.CharField(max_length=180)
    class Meta:
        db_table = u'items'

class Mainview(models.Model):
    name = models.CharField(max_length=300)
    account_id = models.IntegerField()
    wins = models.DecimalField(null=True, max_digits=27, decimal_places=0, blank=True)
    games = models.BigIntegerField()
    perc = models.DecimalField(null=True, max_digits=34, decimal_places=2, blank=True)
    avg_kills = models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)
    avg_deaths = models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)
    avg_assists = models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)
    class Meta:
        db_table = u'mainview'

class Matchdata(models.Model):
    id = models.IntegerField()
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

class Matchdataitems(models.Model):
    id = models.IntegerField()
    match_id = models.IntegerField()
    player_id = models.IntegerField()
    slot = models.IntegerField()
    name = models.CharField(max_length=180)
    class Meta:
        db_table = u'matchdataitems'

class Matchinfo(models.Model):
    match_id = models.IntegerField(primary_key=True)
    radiant_win = models.IntegerField()
    duration = models.IntegerField()
    start_time = models.IntegerField()
    first_blood = models.IntegerField()
    class Meta:
        db_table = u'matchinfo'

class Parsingerrors(models.Model):
    match_id = models.IntegerField(primary_key=True)
    class Meta:
        db_table = u'parsingerrors'

class Playergamedetails(models.Model):
    id = models.IntegerField()
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

class Playermatchdata(models.Model):
    id = models.IntegerField()
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

class Players(models.Model):
    account_id = models.IntegerField(primary_key=True)
    player_name = models.CharField(max_length=300)
    class Meta:
        db_table = u'players'

class Playerview(models.Model):
    name = models.CharField(max_length=300)
    account_id = models.IntegerField()
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

class Searchplayers(models.Model):
    name = models.CharField(max_length=300)
    account_id = models.IntegerField()
    wins = models.DecimalField(null=True, max_digits=27, decimal_places=0, blank=True)
    games = models.BigIntegerField()
    class Meta:
        db_table = u'searchplayers'

class Temp(models.Model):
    player_name = models.CharField(max_length=300)
    account_id = models.IntegerField()
    games = models.BigIntegerField()
    class Meta:
        db_table = u'temp'

class Uwcsplayers(models.Model):
    id = models.IntegerField(primary_key=True)
    lastcheck = models.IntegerField()
    class Meta:
        db_table = u'uwcsplayers'

