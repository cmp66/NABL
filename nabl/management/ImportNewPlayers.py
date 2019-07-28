'''
Created on Mar 16, 2013

@author: carlphil
'''
from player import PlayerManager

  
updater = PlayerManager()
#updater.importNewPlayersForYear("/home/ec2-user/projects/nabl/nabl/CardedList2017.csv", 2017)
updater.findMissingCardedPlayers(2018, 2018)
    
        
