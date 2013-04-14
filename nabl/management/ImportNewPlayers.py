'''
Created on Mar 16, 2013

@author: carlphil
'''
from player import PlayerManager

  
updater = PlayerManager()
#updater.importNewPlayersForYear("/Users/carlphil/Projects/NABL/nabl/CardedList2012.csv", 2012)
updater.findMissingCardedPlayers(2012)
    
        
