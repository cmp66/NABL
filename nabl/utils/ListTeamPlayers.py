'''
Created on May 11, 2013

@author: carlphil
'''
from nabladmin.models import CardedPlayers
from nabladmin.models import Rosterassign
from nabladmin.models import Teams

team = Teams.objects.get(nickname='Stars')
assignedPlayers = Rosterassign.objects.filter(year=2013).filter(teamid=team).values_list("playerid")
cardedPlayers = CardedPlayers.objects.filter(season=2012).filter(player__in=assignedPlayers).order_by('mlbteam')

for player in cardedPlayers:
    print "MLB TEAM: " + player.mlbteam + '  name: ' + player.playername