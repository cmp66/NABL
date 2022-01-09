'''
Created on Mar 16, 2013

@author: carlphil
'''
from player import PlayerManager

  
updater = PlayerManager()
#updater.importNewPlayersForYear("./nabl/files/cardedlists/CardedList2020.csv", 2020)
updater.findMissingCardedPlayers(2020, 2020)
    
        
