'''
Created on Mar 24, 2013

@author: carlphil
'''
from nabladmin.models import Players
from nabladmin.models import Rotowiremissing
import bbref
from django.core.exceptions import ObjectDoesNotExist
import re

def getPlayerByDisplayName(displayName, yearactive):
    return Players.objects.get(displayname__exact=displayName, endyear__exact=yearactive)
    
def getPlayerByFullName(firstname, lastname, yearactive):
    return Players.objects.get(firstname=firstname, lastname=lastname, endyear__exact=yearactive)

if __name__ == '__main__':
    firstname = u'Gavin'
    lastname = u'Floyd'
    
    #firstname = re.sub(r'\.', '\\\.', firstname)
    
    search = bbref.SiteSearch()
    players = search.playerSearch('Alex Wood')
    
    #missingPlayers = Rotowiremissing.objects.all().distinct('playername').order_by('playername')
    # missingPlayers = Rotowiremissing.objects.values('playername').distinct()
    #for player in missingPlayers:
    #    print player.playername
    for player in players:
        print player
    
    try:
        player = getPlayerByDisplayName(firstname + ' ' + lastname, 2013)
    except ObjectDoesNotExist:
        print 'cannot found player by display name: ' + firstname + ' ' + lastname
        
    try:
        player = getPlayerByFullName(firstname, lastname, 2013)
    except ObjectDoesNotExist:
        print 'cannot found player by first/last name: ' + firstname + ' ' + lastname