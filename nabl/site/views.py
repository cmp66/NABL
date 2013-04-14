'''
Created on Feb 10, 2012

@author: cphillips
'''
from django.shortcuts import render_to_response
from nabladmin.models import Rotowiremissing
from django.http import HttpResponse
from django.utils import simplejson
from management.bbref import SiteSearch
import re

def admin(request):  
    adminMode = request.GET.get('mode', 'missing-link')
    
    missingPlayers = Rotowiremissing.objects.values('playername').distinct()
    for player in missingPlayers:
        id = re.sub(r' ', "_", player['playername'])
        player['id'] = id
    return render_to_response('admin.html', { 'mode' : adminMode, 'missingPlayers': missingPlayers})

def rotowireSearch(request):
    mimetype = 'application/javascript'
            
    name = request.GET.__getitem__("playername")
    print name
    playerData = SiteSearch().playerSearch(name)
        
    data = simplejson.dumps(playerData)
    return HttpResponse(data,mimetype)
