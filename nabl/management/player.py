from nabl.nabladmin.models import Players
from nabl.nabladmin.models import CardedPlayers
from nabl.nabladmin.models import Rosterassign
from nabl.nabladmin.models import Draftpicks
from nabl.management.bbref import SiteSearch
import re



class PlayerManager():
    
    def findPlayersWithBBrefLinks(self):
        """
        Retuns a result set of all players who have non null bbreflinks
        """
        return Players.objects.exclude(bbreflink__isnull=True).order_by('lastname')
        
    def getPlayerByDisplayName(self, displayName, yearactive):
        """
        Returns a result set of players with a given display name
        """
        return Players.objects.filter(displayname__exact=displayName, endyear__exact=yearactive)
    
    def getPlayerByFullName(self, firstname, lastname, yearactive):
        """
        Returns a result set of player with the same last and first name
        """
        return Players.objects.filter(firstname__exact=firstname, lastname__exact=lastname, endyear__exact=yearactive)

    def updatePlayerList(self, playerList, requiredYear, startYear):
        """
        Given a list of player model objects, update the internal player record in the database based
        on a search of the online database.
        """
        search = SiteSearch()

        for player in playerList:
            if len(player.bbreflink) <= 5:
                continue
           
            # filter out players who were not active with the requested time window 
            if player.endyear <= requiredYear:
                continue
            
            if player.startyear <= startYear:
                continue
    
            relativelink = re.sub(r'http://www.baseball-reference.com', "", player.bbreflink)
    
            if relativelink.find("players") == -1:
                relativelink = "/players" + relativelink
            
            #print 'looking up:' + player.firstname + ' ' + player.lastname + 'with link:' + relativelink
            bbPlayerData = search.getPlayerData(relativelink)
            
            player.firstname = bbPlayerData['firstname'].decode("utf-8")
            player.lastname = bbPlayerData['lastname'].decode("utf-8")
            player.startyear = bbPlayerData['firstyear']
            player.endyear = bbPlayerData['lastyear']
            player.bbreflink = "http://www.baseball-reference.com" + relativelink
            
            if bbPlayerData['position'].find("Pitcher") >= 0:
                player.position = 'P'
                
            print ' Updating Player: ' + player.firstname + " " + player.lastname
            player.save()
            
    def importNewPlayersForYear(self, fileName, year):
        """
        Creates/Updates the list of carded players in the database from a csv carded list file.
        The format of the csv is <team>,<player name> where <player name> is interpreted as the first
        word is the player's first name and the remaining works are the lastname.
        """
        playerFile = open(fileName, 'r')
        for line in playerFile:
            namesearch = re.search(r'(\w*),(.*)$', line)
            mlbteam = namesearch.group(1)
            playername = namesearch.group(2)
            
            # other crap in the name, filter out just the required stuff
            namesearch = re.search(r'([\w\.]*)\s([\w\.]*)', playername)
            playername = namesearch.group(1) + ' ' + namesearch.group(2)
            
            cardedplayer = CardedPlayers()
            cardedplayer.playername = playername
            cardedplayer.season = year
            cardedplayer.mlbteam = mlbteam
            
            print 'saving player #' + playername + '#'
            cardedplayer.save()
 
 
    def migratePlayers(self, sourceYear, destYear):
        """
        Migrates all team assignments from one year to another
        """
        assignments = Rosterassign.objects.filter(year__exact=sourceYear)
        for assignment in assignments:
            newAssignment = Rosterassign()
            newAssignment.year = destYear
            newAssignment.playerid = assignment.playerid
            newAssignment.teamid = assignment.teamid
            
            print 'migrating ' + str(newAssignment.playerid) + ' on ' + str(newAssignment.teamid)
            newAssignment.save()
            
            
    def findMissingCardedPlayers(self, season):
        """
        Iterates throught the entire list of carded player for a given season and validates against
        players in the main database.  It first checks by search by first/lastname in the database.  If 
        there is no match, it then checks against the display name.
        
        Once a match is found, the carded player is updated with first/last name of the player record and 
        a link to the player record is created in the carded player entry.
        """
        for cardedplayer in CardedPlayers.objects.filter(season=season):
            namesearch = re.search(r'(.*)\s(.*)', cardedplayer.playername)
            firstname = namesearch.group(1)
            lastname = namesearch.group(2)
            players = self.getPlayerByFullName(firstname, lastname, season)
            
            if len(players) == 1:
                cardedplayer.player = players[0]
                cardedplayer.save()
            if len(players) > 1:
                print 'firstname #' + firstname +'# lastname #' + lastname + '#' + ' has multiple entries'
            if len(players) == 0:
                otherplayers = self.getPlayerByDisplayName(firstname + ' ' + lastname, season)
                if len(otherplayers) > 1:
                    print 'firstname #' + firstname +'# lastname #' + lastname + '#' + ' has multiple entries  by displayname'
                if len(otherplayers) == 0:
                    print 'firstname #' + firstname +'# lastname #' + lastname + '#' ' has no player entry using ' + cardedplayer.playername     
                if len(otherplayers) == 1:
                    otherplayer = otherplayers[0]
                    newcardedname = otherplayer.firstname + ' ' + otherplayer.lastname
                    print 'updating ' + cardedplayer.playername + ' to ' + newcardedname
                    cardedplayer.playername = newcardedname 
                    cardedplayer.player = otherplayer
                    cardedplayer.save() 
                    
class DraftPickUpdater():
    
    def migrateDraftPicks(self, sourceYear, targetYear):
        """
        Migrate the draft slots from one year to another.  The player selected field is cleared, 
        along with setting the owner team to the slot team, resulting in a clear draft that has the 
        same teams and order as the prior year.
        """
        sourcePicks = Draftpicks.objects.filter(draftyear__exact=sourceYear)
        for sourcePick in sourcePicks:
            newPick = Draftpicks()
            newPick.draftyear = targetYear
            newPick.playerid = 0
            newPick.ownerteam = sourcePick.slotteam.id
            newPick.slotteam = sourcePick.slotteam
            newPick.round = sourcePick.round
            newPick.save()
        
                          

#updater = PlayerManager()
#playerList = dbPlayerList = updater.findPlayersWithBBrefLinks()
#updater.updatePlayerList(playerList, 2006, 1990)
#updater.importNewPlayersForYear("/Users/cphillips/views/git/NABL/nabl/CardedList2011.csv", 2011)
#updater.findMissingCardedPlayers()
#updater.migrateDraftPicks(2012, 2013)
#updater.migratePlayers(2014, 2015)
updater = DraftPickUpdater()
updater.migrateDraftPicks(2015, 2016)

