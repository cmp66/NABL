#from tastypie.resources import ModelResource
from nabladmin.models import Members
from nabladmin.models import Rotowiremissing 
from nabladmin.models import Players
from tastypie.authorization import Authorization
#from tastypie.resources import ModelResource, ALL, ALL_WITH_RELATIONS
from tastypie.resources import ModelResource, ALL

class MembersResource(ModelResource):
    class Meta:
        queryset = Members.objects.all()
        resource_name = 'Member'
        
class RotowiremissingResource(ModelResource):
    class Meta:
        queryset = Rotowiremissing.objects.all().distinct('playername').order_by('playername')
        resource_name = 'RotowireMissing'
        fields = ['playername']
        
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
        
