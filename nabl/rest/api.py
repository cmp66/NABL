#from tastypie.resources import ModelResource
from nabl.nabladmin.models import Members
from nabl.nabladmin.models import Rotowiremissing 
from nabl.nabladmin.models import Players
from tastypie.authorization import Authorization
#from tastypie.resources import ModelResource, ALL, ALL_WITH_RELATIONS
from tastypie.resources import ModelResource, ALL

class MembersResource(ModelResource):
    class Meta:
        queryset = Members.objects.all()
        resource_name = 'Member'
        
class RotowiremissingResource(ModelResource):
    class Meta:
        #queryset = Rotowiremissing.objects.all().distinct('playername').order_by('playername')
        queryset = Rotowiremissing.objects.filter(active_mlb__exact=1).distinct('playername').order_by('playername')
        resource_name = 'RotowireMissing'
        fields = ['playername']
	filtering = {
	    'active_mlb': ALL,
 	}
        
class PlayersResource(ModelResource):
    class Meta:
        queryset = Players.objects.all()
        resource_name = 'Player'
        fields = ['id', 'firstname', 'lastname', 'displayname', 'startyear', 'endyear', 'bbreflink', 'position']
        authorization= Authorization()
        filtering = {
            'bbreflink': ALL,
            'firstname' : ALL,
        }
        
