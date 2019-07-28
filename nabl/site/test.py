'''
Created on Feb 10, 2012

@author: cphillips
'''
from nabl.nabladmin.models import Rotowiremissing, CardedPlayers
import re

missingPlayers = CardedPlayers.objects.filter(player__isnull=True, season__exact=2016).values('playername')
for player in missingPlayers:
    id = re.sub(r' ', "_", player['playername'])
    player['id'] = id
    print player 
