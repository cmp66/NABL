'''
Created on Apr 28, 2013

@author: carlphil
'''
from bbref import SiteSearch
from nabladmin.models import Rotowiremissing

playerSearch = SiteSearch()
missingPlayers = Rotowiremissing.objects.values('playername').distinct()

for missingPlayer in missingPlayers:
    name = missingPlayer['playername']
    possibleHits = playerSearch.playerSearch(name)
    printedTitle = False

    if possibleHits:
        for player in possibleHits:
            lastyear = int(player['lastyear'])
            if lastyear > 2011:
                if printedTitle is False:
                    print
                    print 'Possible matchers for player: ' + name
                    printedTitle = True
                print player['firstname'] + ' ' + player['lastname'] + '  position: ' + player['position'] +  '  years: ' + player['firstyear'] + '-' + player['lastyear'] 



