'''
Created on Mar 16, 2013

@author: carlphil
'''
from player import PlayerManager

  
updater = PlayerManager()
#updater.importNewPlayersForYear("/home/ec2-user/projects/nabl/nabl/CardedList2019.csv", 2019)
updater.findMissingCardedPlayers(2019, 2019)
    
        
