'''
Created on Mar 16, 2013

@author: carlphil
'''
from player import PlayerManager

  
updater = PlayerManager()
#updater.importNewPlayersForYear("/Users/carlphil/Projects/NABL/nabl/CardedList2014.csv", 2014)
updater.findMissingCardedPlayers(2014)
    
        
