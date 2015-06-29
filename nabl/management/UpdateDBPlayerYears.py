'''
Created on Mar 16, 2013

@author: carlphil
'''
from player import PlayerManager

updater = PlayerManager()
playerList = updater.findPlayersWithBBrefLinks();
updater.updatePlayerList(playerList, 2013, 1990)

