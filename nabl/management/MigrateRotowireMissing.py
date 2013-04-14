'''
Created on Mar 16, 2013

@author: carlphil
'''
from nabladmin.models import Players
from nabladmin.models import Rotowire
from nabladmin.models import Rotowiremissing
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned

def migrateMissingRecords(requiredYear):
    
    for missingRecord in  Rotowiremissing.objects.all():
        try:
            player = Players.objects.get(displayname__exact=missingRecord.playername, endyear__gte=requiredYear)
            
            rotoEntry = Rotowire()
            rotoEntry.player = player
            rotoEntry.mlbteam = missingRecord.mlbteam
            rotoEntry.reportdate = missingRecord.reportdate
            rotoEntry.news = missingRecord.news
            rotoEntry.comment = missingRecord.comment
            
            print 'migrating missing entry for ' + missingRecord.playername + ' for team ' + rotoEntry.mlbteam  +' on date ' + str(rotoEntry.reportdate)
            missingRecord.delete()
            rotoEntry.save()

        except ObjectDoesNotExist :
            continue
        
        except MultipleObjectsReturned :
            print 'Multiple player for  missing entry for ' + missingRecord.playername
            

  
migrateMissingRecords(2011)      
        
