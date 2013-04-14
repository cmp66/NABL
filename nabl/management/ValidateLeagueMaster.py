'''
Created on Mar 24, 2013

@author: carlphil
'''
import xlrd
from nabladmin.models import Teams
from nabladmin.models import Players
from nabladmin.models import Rosterassign
from django.core.exceptions import ObjectDoesNotExist
import re


class LeagueMaster():
    
    def getTeamByCity(self, cityName):
        return Teams.objects.get(city__exact=cityName)
    
    def getPlayerByDisplayName(self, displayName, yearactive):
        return Players.objects.get(displayname__exact=displayName, endyear__gte=yearactive)
    
    def getPlayerByFullName(self, firstname, lastname, yearactive):
        return Players.objects.get(firstname__exact=firstname, lastname__exact=lastname, endyear__gte=yearactive)
    
    def getRosterAssignment(self, player, season):
        return Rosterassign.objects.get(playerid=player.id, year=season)
     
    def loadMasterFile(self, filename):
        self.wb = xlrd.open_workbook(filename)
        
    def getTeamList(self):
        sh = self.wb.sheet_by_name(u'Rosters and available players')
        teams = {}
        
        for rownum in range(3, sh.nrows):
            row = sh.row_values(rownum)
            teamname = row[5]
            
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
        
   
    
    def validatePlayersInFile(self, teams, rosterYear, minYear):
        
        count = 0
        sh = self.wb.sheet_by_name(u'Rosters and available players')
        
        for rownum in range(3, sh.nrows):
            row = sh.row_values(rownum)
        
            lastname = row[2].strip()
            firstname = row[3].strip()
            team = row[5].strip()
            
            
            if firstname == '' or lastname == '':
                continue
            
            player = self.getPlayer(firstname, lastname, minYear)
                
            if player:
                count = count +1
                
                # make sure that he site has the same assignment as the sheet
                if team and team in teams:
                    try:
                        assignment = self.getRosterAssignment(player, rosterYear)
                        if assignment.teamid.id != teams[team].id:
                            print firstname + " " + lastname + ' assigned to ' + team + ' in file but on site is ' + assignment.teamid.city
                    except ObjectDoesNotExist:
                            print firstname + ' ' + lastname + ' assigned to ' +  team + ' in file is not assigned on site'
                #make sure the site also does not have this player assigned
                else:
                    try:
                        assignment = self.getRosterAssignment(player, rosterYear)
                        print firstname + ' ' + lastname + ' not assigned in file is assigned on site to ' + assignment.teamid.city
                    except ObjectDoesNotExist:
                        continue
            else:
                print 'cannot find player: #' + firstname + "# #" + lastname +'#'
                
            
                
                
        print 'successful count: ' + str(count)
    
if __name__ == '__main__':
    master = LeagueMaster()
    master.loadMasterFile(u'/Users/carlphil/Projects/NABL/nabl/NABL2013 Master.xlsx')
    teams = master.getTeamList()
    master.validatePlayersInFile(teams, 2013, 2011)
    
