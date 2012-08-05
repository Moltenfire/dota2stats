from mainstats.models import Heroes, Items, Uwcsplayers
from django.contrib import admin

class HeroesAdmin(admin.ModelAdmin):
    fields = [('hero_id', 'hero_name')]
    list_display = ('hero_id', 'hero_name')
    search_fields = ['hero_name']
    
class ItemsAdmin(admin.ModelAdmin):
    fields = [('item_id', 'item_name')]
    list_display = ('item_id', 'item_name')
    search_fields = ['item_name']
    
class UWCSAdmin(admin.ModelAdmin):
    fields = [('id', 'lastcheck')]
    list_display = ('id', 'lastcheck')

admin.site.register(Heroes, HeroesAdmin)
admin.site.register(Items, ItemsAdmin)
admin.site.register(Uwcsplayers, UWCSAdmin)
