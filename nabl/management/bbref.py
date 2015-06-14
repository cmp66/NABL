import httplib
import re

from nabladmin.models import Players
from nabladmin.models import Rosterassign

class SiteSearch():

        def getPosition(self, htmlResponse):
            positionMatch = re.search(r'<strong>Positio.*itemprop="role">(.*)</span>', htmlResponse)
            
            if positionMatch:
                position = positionMatch.group(1)
                position = re.sub(r':\s', "", position)
                return position
            
        
        def findPossibleMatches(self, httpResponseData):
            
            players = []
            for m in re.finditer(r'<a href="(/players/\w/\w*.shtml)">([a-zA-z]*(&nbsp;[a-zA-Z]*)*)</a></td>', httpResponseData):
                url = m.group(1)
                #displayName = re.sub(r'&nbsp;', " ", m.group(2))
                #nameMatch = re.match('(.\w*) (.*)', displayName)
                #print 'url:' + url + '   ---firstName:' + nameMatch.group(1) + '   ---lastname:' + nameMatch.group(2)
                playerData = self.getPlayerData(url)
                #playerData['firstname'] = nameMatch.group(1)
                #//playerData['lastname'] = nameMatch.group(2)
                #playerData['url'] = url
                players.append(playerData)
                
            for m in re.finditer(r'<a href="http://www.baseball-reference.com(/players/\w/\w*.shtml)"', httpResponseData):
                url = m.group(1)
                #displayName = re.sub(r'&nbsp;', " ", m.group(2))
                #nameMatch = re.match('(.\w*) (.*)', displayName)
                #print 'url:' + url + '   ---firstName:' + nameMatch.group(1) + '   ---lastname:' + nameMatch.group(2)
                playerData = self.getPlayerData(url)
                #playerData['firstname'] = nameMatch.group(1)
                #//playerData['lastname'] = nameMatch.group(2)
                #playerData['url'] = url
                players.append(playerData)
                
            return players
              
        def getPlayerStats(self, year, htmlResponse):
            for stats in re.finditer(r'pitching_standard.2014\">[\s\w\n]*(<td.*</td>[\s\w\n]*)*.*', htmlResponse):
                print 'Year' + stats.group(1)
                print 'Year' + stats.group(2)
                print 'Year' + stats.group(3)
                print 'Year' + stats.group(4)
                print 'Year' + stats.group(5)
                print 'Year' + stats.group(6)
                print 'Year' + stats.group(7)
            
                
        def getPlayerDataFromPage(self, htmlResponse):      
            #print htmlResponse
            #pattern = re.compile('<h1 class="float_left">(\w*)\s([\w\s]*)</h1>', re.UNICODE)
            name = re.search(r'<span id="player_name" itemprop="name" class="bold_text xx_large_text">(.*?)\s(.*?)</span>', htmlResponse)
            #name = re.search(r'<h1 class="float_left">(.*?)\s(.*?)</h1>', htmlResponse)
            firstname = name.group(1)
            lastname = name.group(2)
            
            position = self.getPosition(htmlResponse)
            
            #yearsMatch = re.search(r'(\d{4})-(\d{4})', htmlResponse)
            yearsMatch = re.search(r'<br><strong>Tea\w*?</strong>.*?(\d{4})', htmlResponse)
            firstYear = yearsMatch.group(1)
            
            yearsMatch = re.search(r'<br><strong>Tea\w*?</strong>.*?(\d{4})-(\d{4})', htmlResponse)
            if yearsMatch:
                lastYear = yearsMatch.group(2)
            else:
                lastYear = firstYear
                
            #print 'Position:' + position + '    firstyear:' + firstYear + '    lastyear:' + lastYear + '   firstname: ' + firstname + '    lastname: ' + lastname
            
            return {'firstname': firstname, 'lastname': lastname, 'position' : position, 'firstyear' : firstYear, 'lastyear' : lastYear}

        def playerSearch(self, playerName):
            players = []
            filteredName = re.sub(r'\s', "+", playerName)
            conn = httplib.HTTPConnection("www.baseball-reference.com")
            conn.request("GET", "/pl/player_search.cgi?search=" + filteredName)
            response = conn.getresponse()
            responseData = response.read()
            
#            positionCheck = self.getPosition(responseData)
            
#            if positionCheck:
#                playerData = self.getPlayerDataFromPage(responseData)
                #playerData['url'
#                players.append(playerData)
#            else:
            players = self.findPossibleMatches(responseData);
        
            return players
        
        def getPlayerData(self, relativeUrl):
            conn = httplib.HTTPConnection("www.baseball-reference.com")
            conn.request("GET", relativeUrl)
            response = conn.getresponse().read()
            
            #print relativeUrl
            playerData = self.getPlayerDataFromPage(response)
            playerData['url'] = relativeUrl
            
            #print 'getting data for ' + relativeUrl
            #if playerData['position'] == 'Pitcher':
                #print 'Pitcher'
                #playerData['stats'] = self.getPlayerStats('2014', response)
            return playerData
         
#search = SiteSearch()  
#assignsList = Rosterassign.objects.filter(year=2014).values_list("playerid") 
#unownedplayers = Players.objects.filter(endyear=2013).exclude(id__in=assignsList) 
#for player in unownedplayers:
#    relativeUrl = re.search(r'http://www.baseball-reference.com(/players/\w/\w*.shtml)', player.bbreflink) 
#    search.getPlayerData(relativeUrl.group(1))       
            
            
            
            
