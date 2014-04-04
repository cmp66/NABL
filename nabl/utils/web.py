'''
Created on Mar 18, 2012

@author: cphillips
'''
import mechanize
import cookielib
import re
import urllib
from time import sleep
from nabladmin.models import Players
from nabladmin.models import Rotowire
from nabladmin.models import Rotowiremissing
from django.core.exceptions import ObjectDoesNotExist
from django.core.exceptions import MultipleObjectsReturned
from django.db.utils import DatabaseError
from dateutil import parser
from django.db import transaction

class Browser():
    br = mechanize.Browser()
    cj = cookielib.LWPCookieJar()
    
    def __init__(self):
        
        self.br.set_cookiejar(self.cj)

        # Browser options
        self.br.set_handle_equiv(True)
        #self.br.set_handle_gzip(True)
        self.br.set_handle_redirect(True)
        self.br.set_handle_referer(True)
        self.br.set_handle_robots(False)

        # Follows refresh 0 but not hangs on refresh > 0
        self.br.set_handle_refresh(mechanize._http.HTTPRefreshProcessor(), max_time=1)

        # Want debugging messages?
        #br.set_debug_http(True)
        #br.set_debug_redirects(True)
        #br.set_debug_responses(True)

        # User-Agent (this is cheating, ok?)
        self.br.addheaders = [('User-agent', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008071615 Fedora/3.0.1-1.fc9 Firefox/3.0.1')]
    
    
    def browseURL(self, url):
        self.br.add_password('rotowire.com', 'cmp66', 'buckeye')
        response = self.br.open(url)
        html = response.read()



        # Show the response headers
        #print response.info()
        # or
        #print self.br.response().info()

        # Show the available forms
        #for f in self.br.forms():
        #    print f

        # Select the first (index zero) form
        self.br.select_form(nr=0)

        self.br.form['username']='cmp66'
        self.br.form['p1']='buckeye'
        self.br.submit()
        return self.br.response().read()

        
    def addMissingRotowirePlayerEntry(self, name, team, date, text1, text2):
        try:
            missingEntry = Rotowiremissing.objects.get(news__exact=text1)
            print 'duplicate missing object found for ' + name
        except ObjectDoesNotExist:
                print 'adding mssing entry for ' + name + ' for team ' + team +' on date ' + str(date)
                rotoEntry = Rotowiremissing()
                rotoEntry.playername = name
                rotoEntry.mlbteam = team
                rotoEntry.reportdate = date
                rotoEntry.news = text1
                rotoEntry.comment = text2
                rotoEntry.save()
 
    @transaction.commit_manually       
    def addRotowirePlayerEntry(self, name, team, date, text1, text2, requiredYear):
        parsedDate = parser.parse(date)
        text1.replace('"', '\\"').replace("'", "\\'")
        text2.replace('"', '\\"').replace("'", "\\'")
        #text1.replace(u"\uFFFD","\\'")
        #text2.replace(u"\uFFFD","\\'")
                
        try:
            urllib.quote(text1.encode('utf-8'))
            urllib.quote(text2.encode('utf-8'))
        except UnicodeDecodeError:
            transaction.commit()
            return True
        
        try:
            player = Players.objects.get(displayname__exact=name, endyear__gte=requiredYear)
  
            
            #check for duplicate news entry
            try:
                rotowireEntry = Rotowire.objects.get(news__exact=text1)
                print 'duplicate object found for ' + player.displayname
                transaction.commit()
                return False
            except ObjectDoesNotExist:
                print 'adding rotowire entry for ' + player.displayname + ' for team ' + team +' on date ' + str(parsedDate)
                rotoEntry = Rotowire()
                rotoEntry.player = player
                rotoEntry.mlbteam = team
                rotoEntry.reportdate = parsedDate
                rotoEntry.news = text1
                rotoEntry.comment = text2
                try:
                    rotoEntry.save()
                    transaction.commit()
                except DatabaseError:
                    print 'Database exception trying to add rotowire entry for ' + player.displayname + ' for team ' + team +' on date ' + str(parsedDate) # + 'with text1:' + text1 + '   text2: ' + text2
                    transaction.rollback()
            except DatabaseError:
                    print 'Database exception trying to check for rotowire entry for ' + player.displayname + ' for team ' + team +' on date ' + str(parsedDate) #+ 'with text:' + text1
                    transaction.rollback()
            except UnicodeDecodeError:
                    print 'Exception trying decode news ' + player.displayname + ' for team ' + team +' on date ' + str(parsedDate) #+ 'with text:' + text1
                    transaction.rollback()
        except ObjectDoesNotExist :
            try:
                self.addMissingRotowirePlayerEntry(name, team, parsedDate, text1, text2)
                transaction.commit()
            except DatabaseError:
                print 'Exception adding missing entry for ' + name + ' for team ' + team +' on date ' + str(date)
                transaction.rollback()
        except MultipleObjectsReturned :
            try:
                self.addMissingRotowirePlayerEntry(name, team, parsedDate, text1, text2)
                transaction.commit()
            except DatabaseError:
                print 'Exception adding missing entry for ' + name + ' for team ' + team +' on date ' + str(date)
                transaction.rollback()
            
        return True
        
    def decodePage(self, html):
            namematch=r'player.htm\?id=[\d]*\"\>([\w\s\'\.-]*)'
            datematch=r'news-item-date\"\>(\d*/\d*/\d*)'
            newsmatch=r'news-item-news\"\s*\>(.*)\</div'
            analysismatch=r'\<p\>Fantasy\sAnalysis'
            analysistext=r'[\s]*(.*)'

            mode='date'
            name = ''
            team= ''
            date = ''
            text1 = ''
            text2 = ''

            for line in html.splitlines():
                if mode == 'name':
                    found = re.search(namematch, line)
                    if found:
                        name = found.group(1)
                        team = "MLB"
                        mode = 'news'
                    continue
                if mode == 'date':
                    found = re.search(datematch, line)
                    if found:
                        date = found.group(1)
                        mode = 'name'
                    continue
                if mode == 'news':
                    found = re.search(newsmatch, line)
                    if found:
                        text1 = found.group(1)
                        #text1 = text1.decode("utf-8")
                        mode = 'analysisfind'
                    continue
                if mode == 'analysisfind':
                    found = re.search(analysismatch, line)
                    if found:
                        mode = 'analysistext'
                    continue
                if mode == 'analysistext':
                    found = re.search(analysistext, line)
                    if found:
                        text2 = found.group(1)
                        #text2 = text2.decode("utf-8")
                        print name + "#" + date +"#" + text1 + "#" + text2
                        foundDuplicate = self.addRotowirePlayerEntry(name, team, date, text1, text2, 2011)
                        if foundDuplicate == False:
                            return False
                    mode = 'date'
                    continue
            return True
        
    def advancePage(self):
        self.br.select_form(nr=1)
        self.br.submit()
        return self.br.response().read()
        
        
browser = Browser()
readHTML = browser.browseURL("http://www.rotowire.com/baseball/latestnews.htm")
continueReading = browser.decodePage(readHTML)


while continueReading == True:
    sleep(5.0)
    readHTML= browser.advancePage();
    continueReading = browser.decodePage(readHTML)
    


