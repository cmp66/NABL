'''
Created on Apr 16, 2013

@author: carlphil
'''
from nabladmin.models import Rosterassign
from nabladmin.models import Teams
from nabladmin.models import Rotowire
from nabladmin.models import Players
from nabladmin.models import Emailaddresses
from nabladmin.models import Teamresults
from nabladmin.models import CardedPlayers
from nabladmin.models import Playercuts
from datetime import datetime, timedelta
import textwrap
import smtplib
from email.mime.text import MIMEText


    
def getPlayersForTeam(team):    
    assignsList = Rosterassign.objects.filter(teamid_id=team.id, year=2013).values_list("playerid")
    playerList = Players.objects.filter(id__in=assignsList).values_list("id")

    return playerList

def sendEmailNews(playerList, emailAddresses):
    
    today = datetime.today().date()
    yesterday = today - timedelta(days=1)

    news = Rotowire.objects.filter(player__in=playerList, reportdate__gte=yesterday, reportdate__lte=today).order_by('player__lastname', 'reportdate')
    
    body = ''
    for newsitem in news:
        body = body +  newsitem.player.displayname
        body = body + '\n------------------------------\n'
        for line in textwrap.wrap('News: ' + newsitem.news, 80):
            body = body + line + '\n'
        body = body + '\n'
        for line in textwrap.wrap('\nComment: ' + newsitem.comment, 80):
            body = body + line + '\n'
        body = body + '\n\n'
    
    for address in emailAddresses:
        if address.primaryaddress == 'Y':
            print "emailing to " + address.address
            targetAddress = address.address
            break
    
    msg = MIMEText(body)
    msg['Subject'] =  'NABL Player News for ' + str(yesterday)
    msg['From'] = 'cphillips@wahoosfotware.com'
    msg['To'] = targetAddress
    
    server = smtplib.SMTP('mail.wahoosoftware.com', 5125)
    server.login('cphillips@wahoosoftware.com', 'buckeye') 
    server.sendmail('cphillips@wahoosoftware.com', [targetAddress], msg.as_string())
    server.quit()
    
for teamresult in Teamresults.objects.filter(year=2013):
    emailAddresses = Emailaddresses.objects.filter(memberid=teamresult.teamid.memberid)
    playerList = getPlayersForTeam(teamresult.teamid)
    sendEmailNews(playerList, emailAddresses)
    
assignsList = Rosterassign.objects.filter(year=2013).values_list("playerid")
undraftedCardedPlayers = CardedPlayers.objects.filter(season=2012).exclude(player__in=assignsList).values_list("player")
playerCuts = Playercuts.objects.all().values_list("playerid")

undraftedPlayers = Players.objects.filter(id__in=undraftedCardedPlayers)
undraftedUncardedPlayers = Players.objects.filter(id__in=playerCuts).exclude(id__in=undraftedCardedPlayers)

team = Teams.objects.get(nickname='Antiques');
emailAddresses = Emailaddresses.objects.filter(memberid=team.memberid)
sendEmailNews(undraftedPlayers, emailAddresses)
sendEmailNews(undraftedUncardedPlayers, emailAddresses)
   
    