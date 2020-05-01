'''
Created on Mar 24, 2013

@author: carlphil
'''
import xlrd
from nabl.nabladmin.models import Teams
from nabl.nabladmin.models import Players
from nabl.nabladmin.models import Rosterassign
from nabl.nabladmin.models import CardedPlayers
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned
import os


class LeagueMaster():
    def getTeamByCity(self, cityName):
        return Teams.objects.get(city__exact=cityName)

    def getPlayerByDisplayName(self, displayName, yearactive):
        return Players.objects.get(displayname__exact=displayName, endyear__gte=yearactive)

    def getPlayerByFullName(self, firstname, lastname, yearactive):
        return Players.objects.get(firstname__exact=firstname, lastname__exact=lastname, endyear__gte=yearactive)

    def getRosterAssignment(self, player, season):
        return Rosterassign.objects.get(playerid=player.id, year=season)

    def getCardedPlayer(self, name, cardedyear):
        return CardedPlayers.objects.get(playername=name, season=cardedyear)

    def loadMasterFile(self, filename):
        self.wb = xlrd.open_workbook(filename)

    def getTeamList(self):
        sh = self.wb.sheet_by_name(u'Rosters and available players')
        teams = {}

        for rownum in range(3, sh.nrows):
            row = sh.row_values(rownum)
            teamname = row[4]

            #print "getting team {}".format(teamname)

            if teamname and not u'zz' in teamname:
                nablTeam = self.getTeamByCity(teamname)
                if nablTeam:
                    teams[teamname] = nablTeam
                else:
                    print 'cannot find team for ' + teamname

        return teams

    def getPlayer(self, firstname, lastname, minYear):
        player = None
        try:
            player = self.getPlayerByDisplayName(firstname + ' ' + lastname, minYear)
            return player
        except ObjectDoesNotExist:
            try:
                player = self.getPlayerByFullName(firstname, lastname, minYear)
                return player
            except ObjectDoesNotExist:
                return None

    def validatePlayersInFile(self, teams, rosterYear, cardedYear, minYear):

        count = 0
        sh = self.wb.sheet_by_name(u'Rosters and available players')

        for rownum in range(3, 1001):
            row = sh.row_values(rownum)

            lastname = row[1].strip()
            firstname = row[2].strip()
            mlbteam = row[3].strip()
            team = row[4].strip()

            if firstname == '' or lastname == '':
                continue

            #print 'Validating player {} {}'.format(firstname, lastname)
            player = self.getPlayer(firstname, lastname, minYear)

            if player:
                count = count + 1

                # make sure that he site has the same assignment as the sheet
                if team and team in teams:
                    try:
                        assignment = self.getRosterAssignment(player, rosterYear)
                        if assignment.teamid.id != teams[team].id:
                            print firstname + " " + lastname + ' assigned to ' + team + ' in file but on site is ' + assignment.teamid.city
                    except ObjectDoesNotExist:
                        print firstname + ' ' + lastname + ' assigned to ' + team + ' in file is not assigned on site'
                    except MultipleObjectsReturned:
                        print firstname + ' ' + lastname + ' assigned to multiple teams on site'
                # make sure the site also does not have this player assigned
                else:
                    try:
                        assignment = self.getRosterAssignment(player, rosterYear)
                        print firstname + ' ' + lastname + ' not assigned in file is assigned on site to ' + assignment.teamid.city
                    except ObjectDoesNotExist:
                        pass

                if mlbteam != 'unc':
                    try:
                        self.getCardedPlayer(player.firstname + ' ' + player.lastname, cardedYear) 
                    except ObjectDoesNotExist:
                        print 'cannot find card for  player: #' + firstname + "# #" + lastname + '#'
                else:
                    try:
                        self.getCardedPlayer(player.firstname + ' ' + player.lastname, cardedYear)
                        print 'showing card for unc  player: #' + firstname + "# #" + lastname + '#'
                    except ObjectDoesNotExist:
                        pass

            else:
                print 'cannot find player: #' + firstname + "# #" + lastname + '#'

        print 'successful count: ' + str(count)


if __name__ == '__main__':
    master = LeagueMaster()
    #projectRoot = os.environ["PROJECT_ROOT"]
    master.loadMasterFile(u'./nabl/files/NABL2020_Master_050120.xlsx')
    teams = master.getTeamList()
    master.validatePlayersInFile(teams, 2020, 2019, 2015)
