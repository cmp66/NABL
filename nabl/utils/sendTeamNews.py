'''
Created on Apr 16, 2013

@author: carlphil
'''
from nabl.nabladmin.models import Rosterassign
from nabl.nabladmin.models import Rotowire
from nabl.nabladmin.models import Players
from nabl.nabladmin.models import Emailaddresses
from nabl.nabladmin.models import Teamresults
from datetime import datetime, timedelta
import textwrap
import smtplib
from email.mime.text import MIMEText


    
def getPlayersForTeam(team):    
    assignsList = Rosterassign.objects.filter(teamid_id=team.id, year=2018).values_list("playerid")
    playerList = Players.objects.filter(id__in=assignsList).values_list("id")

    return playerList

def sendEmailNews(playerList,emailAddresses, subject):
    
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
    msg['Subject'] =  subject + str(yesterday)
    msg['From'] = 'cmp1166@gmail.com'
    msg['To'] = targetAddress
    
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.ehlo()
    server.starttls()
    server.login('cmp1166@gmail.com', 'rulg qtrl gjta kfdm') 
    server.sendmail('cmp1166@gmail.com', [targetAddress], msg.as_string())
    server.quit()
    
assignsList = Rosterassign.objects.filter(year=2018).values_list("playerid")
unownedplayers = Players.objects.filter(endyear=2017).exclude(id__in=assignsList)
    
for teamresult in Teamresults.objects.filter(year=2018):
    emailAddresses = Emailaddresses.objects.filter(memberid=teamresult.teamid.memberid)
    playerList = getPlayersForTeam(teamresult.teamid)
    sendEmailNews(playerList, emailAddresses, teamresult.teamid.nickname + ' Player News for ')
    
    sendEmailNews(unownedplayers, emailAddresses, 'Unowned Player News for ')


#undraftedCardedPlayers = CardedPlayers.objects.filter(season=2012).exclude(player__in=assignsList).values_list("player")
#playerCuts = Playercuts.objects.all().values_list("playerid")

#undraftedPlayers = Players.objects.filter(id__in=undraftedCardedPlayers)
#undraftedUncardedPlayers = Players.objects.filter(id__in=playerCuts).exclude(id__in=undraftedCardedPlayers)


#team = Teams.objects.get(nickname='Antiques');
#emailAddresses = Emailaddresses.objects.filter(memberid=team.memberid)

#sendEmailNews(undraftedUncardedPlayers, emailAddresses)
   
    
