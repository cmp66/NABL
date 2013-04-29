import httplib
import re

class SiteSearch():

        def getPosition(self, htmlResponse):
            positionMatch = re.search(r'<strong>Positio.*</strong>(.*)', htmlResponse)
            
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
                 
                
        def getPlayerDataFromPage(self, htmlResponse):      
            #print htmlResponse
            #pattern = re.compile('<h1 class="float_left">(\w*)\s([\w\s]*)</h1>', re.UNICODE)
            name = re.search(r'<span class="bold_text xx_large_text">(.*?)\s(.*?)</span>', htmlResponse)
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
            return playerData
            
            
            
            
            
            