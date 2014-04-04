'''
Created on Mar 16, 2013

@author: carlphil
'''
from player import PlayerManager

  
updater = PlayerManager()
#updater.importNewPlayersForYear("/Users/carlphil/Projects/NABL/nabl/CardedList2013.csv", 2013)
updater.findMissingCardedPlayers(2013)
    
        
