import httplib
import re

from nabl.nabladmin.models import Players
from nabl.nabladmin.models import Rosterassign


class SiteSearch():
    def getPosition(self, htmlResponse):
        positionMatch = re.search(r'<strong>Positio.*<\/strong>\n(.*)\n', htmlResponse)
        #positionMatch = re.search(r'<strong>Positio.*itemprop="role">(.*)</span>', htmlResponse)

        if positionMatch:
            position = positionMatch.group(1)
            position = re.sub(r'\n', "", position)
            position = re.sub(r'\r', "", position)
            return position.strip()

    def findPossibleMatches(self, httpResponseData):

        players = []
        print 'looking through responses'
        for m in re.finditer(r'<strong><a.*href="(/players/\w/\w*.shtml)">', httpResponseData):
            url = m.group(1)
            # displayName = re.sub(r'&nbsp;', " ", m.group(2))
            # nameMatch = re.match('(.\w*) (.*)', displayName)
            # print 'url:' + url + '   ---firstName:' + nameMatch.group(1) + '   ---lastname:' + nameMatch.group(2)
            print "getting data for " + url
            playerData = self.getPlayerData(url)
            # playerData['firstname'] = nameMatch.group(1)
            # //playerData['lastname'] = nameMatch.group(2)
            # playerData['url'] = url
            players.append(playerData)

        for m in re.finditer(r'<a href="http://www.baseball-reference.com(/players/\w/\w*.shtml)"', httpResponseData):
            url = m.group(1)
            # displayName = re.sub(r'&nbsp;', " ", m.group(2))
            # nameMatch = re.match('(.\w*) (.*)', displayName)
            # print 'url:' + url + '   ---firstName:' + nameMatch.group(1) + '   ---lastname:' + nameMatch.group(2)
            playerData = self.getPlayerData(url)
            # playerData['firstname'] = nameMatch.group(1)
            # //playerData['lastname'] = nameMatch.group(2)
            # playerData['url'] = url
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
        # print htmlResponse
        # pattern = re.compile('<h1 class="float_left">(\w*)\s([\w\s]*)</h1>', re.UNICODE)
        #name = re.search(r'<span id=player_name itemprop="name" class="bold_text xx_large_text">(.*?)\s(.*?)</span>',
        #                 htmlResponse)
        name = re.search(r'<h1 itemprop="name">(.*?)\s(.*?)</h1>',
                         htmlResponse)

        if name is None:
            name = re.search(r'<span id="player_name" itemprop="name" class="bold_text xx_large_text">(.*?)\s(.*?)</span>',
                         htmlResponse)
        # name = re.search(r'<h1 class="float_left">(.*?)\s(.*?)</h1>', htmlResponse)
        firstname = name.group(1)
        lastname = name.group(2)

        position = self.getPosition(htmlResponse)
        # yearsMatch = re.search(r'(\d{4})-(\d{4})', htmlResponse)
        #yearsMatch = re.search(r'<br><strong>Tea\w*?</strong>.*?(\d{4})', htmlResponse)
        yearsMatch = re.search(r'Debut:.*\n.*<a.*>\w+\s\d+,\s(\d+)', htmlResponse)
        firstYear = yearsMatch.group(1)

        #yearsMatch = re.search(r'<br><strong>Tea\w*?</strong>.*?(\d{4})-(\d{4})', htmlResponse)
        yearsMatch = re.search(r'Last Game:.*\n.*<a.*>\w+\s\d+,\s(\d+)', htmlResponse)
        if yearsMatch:
            lastYear = yearsMatch.group(1)
        else:
            lastYear = firstYear
            for m in re.finditer(r't=f&amp;year=(\d+)', htmlResponse):
                recordYear = m.group(1)
                if recordYear > lastYear:
                    lastYear = recordYear
            

        print 'Position:' + position + '    firstyear:' + firstYear + '    lastyear:' + lastYear + '   firstname: ' + firstname + '    lastname: ' + lastname

        return {'firstname': firstname, 'lastname': lastname, 'position': position, 'firstyear': firstYear,
                'lastyear': lastYear}

    def playerSearch(self, playerName):
        players = []
        filteredName = re.sub(r'\s', "+", playerName)
        conn = httplib.HTTPSConnection("www.baseball-reference.com")
        print 'looking for ' + filteredName
        conn.request("GET", "/search/search.fcgi?search=" + filteredName)
        response = conn.getresponse()
        responseData = response.read()

        if response.status == 302:
            relativeURL = response.getheader('Location')
            if 'search' in relativeURL:
                conn.request("GET", response.getheader('Location'))
                response = conn.getresponse()
                responseData = response.read()
                players = self.findPossibleMatches(responseData)
            elif 'minors' not in relativeURL and 'japan' not in relativeURL and 'register' not in relativeURL:
                playerData = self.getPlayerData(response.getheader('Location'))
                players.append(playerData)
        else:
            players = self.findPossibleMatches(responseData);

        return players

    def getPlayerData(self, relativeUrl):
        conn = httplib.HTTPSConnection("www.baseball-reference.com")
        conn.request("GET", relativeUrl)
        response = conn.getresponse().read()
        print "got player data"

        # print relativeUrl
        playerData = self.getPlayerDataFromPage(response)
        playerData['url'] = relativeUrl

        # print 'getting data for ' + relativeUrl
        # if playerData['position'] == 'Pitcher':
        # print 'Pitcher'
        # playerData['stats'] = self.getPlayerStats('2014', response)
        return playerData  # search = SiteSearch()


# assignsList = Rosterassign.objects.filter(year=2014).values_list("playerid")
# unownedplayers = Players.objects.filter(endyear=2013).exclude(id__in=assignsList)
# for player in unownedplayers:
#    relativeUrl = re.search(r'http://www.baseball-reference.com(/players/\w/\w*.shtml)', player.bbreflink) 
#    search.getPlayerData(relativeUrl.group(1))
