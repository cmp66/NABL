'''
Created on Mar 18, 2012

@author: cphillips
'''
import mechanize
import cookielib
import re
import urllib
from time import sleep
from nabl.nabladmin.models import Players
from nabl.nabladmin.models import Rotowire
from nabl.nabladmin.models import Rotowiremissing
from django.core.exceptions import ObjectDoesNotExist
from django.core.exceptions import MultipleObjectsReturned
from django.db.utils import DatabaseError
from dateutil import parser
from django.db import transaction
from datetime import datetime

class Browser():
    
    def __init__(self):

        self.br = mechanize.Browser()
        self.cj = cookielib.LWPCookieJar()
        
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
        self.br.set_debug_http(True)
        self.br.set_debug_redirects(True)
        self.br.set_debug_responses(True)

        # User-Agent (this is cheating, ok?)
        self.br.addheaders = [('User-agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36')]
    
    
    def browseURL(self, url):
        #self.br.add_password('rotowire.com', 'cmp66', 'buckeye')
        response = self.br.open(url)
        #html = response.read()



        # Show the response headers
        #print response.info()
        # or
        #print self.br.response().info()

        # Show the available forms
        #for f in self.br.forms():
        #    print f

        # Select the first (index zero) form
        self.br.select_form(nr=0)

        self.br.form["username"]="cmp66"
        self.br.form["password"]="buckeye"
        self.br.form["g-recaptcha-response"]="03AOLTBLSdv_1Wt-Dt0_zHl5fR_JLaUQkLB1HObPco_dHOXUcY6odwhZenElRI5v_t9GVzdZly5htR0wRAv55eQg4KRhFUOslj6jtBW-kRxfBFbm7RPmaB_ukdlzKjE1qoowy9b7fb5eHiENgC5Ef2ehl4ItRVs0BPu_VlZmFCtbk40RHIUecFl3ZDg8UWwf-_GtqedttxZOTkW6r9JLQu1muJLUhTIGvdGvG0gdHHxBmH8HVrvQaY1KFMKrZvsTJeOQzZX8nEEwLXLJkHHOpTfFcd_mz_CWzJ8pM9hZsUmBOE8iICKF5_Cpdj-2UdXd8e2Ne4z8JF81eo"
        response = self.br.submit()
        return response.read()

    def openURL(self, url):
        print self.cj
        response = self.br.open(url)
        html = response.read()

        return html

        
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
                rotoEntry.active_mlb = 0;
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
            except DatabaseError, err:
                print 'Exception adding missing entry for ' + name + ' for team ' + team +' on date ' + str(date) + '--------' + str(err)
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
            topmatch=r'\<div class=\\"news-update\\"\>'
            topmatch2=r'\<div class=\\"news-update is-injured\\"\>'
            namematch=r'player.php\?id=[\d]*\\"\>([\w\s\'\.-]*)'
            datematch=r'news-update__timestamp\\"\>(.*)\<'
            newsmatch=r'news-update__news\\"\>(.*)\<\\/div'
            analysismatch=r'news-update__analysis\\"\>\<b\>ANALYSIS\<\\/b\>\<br\>(.*)\<'
            analysistext=r'[\s]*(.*)'

            mode='topmatch'
            name = ''
            team= ''
            date = ''
            text1 = ''
            text2 = ''

            for line in html.split('\\r\\n'):
            #for line in html.splitlines():
                #print line
                if mode == 'topmatch':
                    found = re.search(topmatch, line)
                    if found:
                        mode = 'name'
                        #print 'FOUND'
                    else:
                        found = re.search(topmatch2, line)
                        if found:
                            mode = 'name'
                            #print 'FOUND INJURED'
                    continue
                if mode == 'name':
                    found = re.search(namematch, line)
                    if found:
                        name = found.group(1)
                        team = "MLB"
                        mode = 'date'
                        #print name
                    continue
                if mode == 'date':
                    found = re.search(datematch, line)
                    if found:
                        date = found.group(1)
                        mode = 'news'
                        #print date
                    continue
                if mode == 'news':
                    found = re.search(newsmatch, line)
                    if found:
                        text1 = found.group(1)
                        text1 = text1.decode("utf-8")
                        mode = 'analysistext'
                        #print text1
                    continue
                if mode == 'analysisfind':
                    found = re.search(analysismatch, line)
                    if found:
                        mode = 'analysistext'
                    continue
                if mode == 'analysistext':
                    found = re.search(analysismatch, line)
                    if found:
                        text2 = found.group(1)
                        text2 = text2.decode("utf-8")
                        print name + "#" + date +"#" + text1 + "#" + text2
                        #foundDuplicate = self.addRotowirePlayerEntry(name, team, date, text1, text2, 2015)
                        #if foundDuplicate == False:
                        #    return False
                        mode = 'topmatch'
                    continue
            return True
        
    def advancePage(self):
        #self.br.select_form(nr=0)
        self.br.submit(type='button')
        return self.br.response().read()
        

timestring="2019-02-28%2007%3A56%3A27.953&"
date_string = datetime.now().replace(microsecond=0).isoformat().replace('T', '%20').replace(':', '%3A')
url_string = "https://www.rotowire.com/baseball/ajax/get-more-updates.php?type=custom&itemID=custom&lastUpdateTime={}&numUpdates=2&priority=3".format(date_string)
print url_string
browser = Browser()
#readHTML = browser.browseURL("http://www.rotowire.com/baseball/latestnews.htm")
##readHTML = browser.browseURL("https://www.rotowire.com/users/login.php")
#print readHTML
#readHTML = browser.openURL("https://www.rotowire.com/baseball/news.php")
readHTML = browser.openURL(url_string)
#readHTML = browser.browseURL("https://www.rotowire.com/baseball/news.php")
continueReading = browser.decodePage(readHTML)


#while continueReading == True:
#    sleep(2.0)
#    readHTML= browser.advancePage();
#    continueReading = browser.decodePage(readHTML)
    


