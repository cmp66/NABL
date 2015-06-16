'''
Created on Apr 22, 2012

@author: cphillips
'''

from nabl.nabladmin.models import Schedules


class ScheduleUpdater():
    
    def copySchedule(self, sourceSeason, newSeason):
        records = Schedules.objects.filter(year__exact=sourceSeason)
        for scheduleRecord in records:
            newRecord = Schedules()
            newRecord.year = newSeason
            newRecord.hometeam = scheduleRecord.hometeam
            newRecord.homewins = 0
            newRecord.monthidx = scheduleRecord.monthidx
            newRecord.numgames = scheduleRecord.numgames
            newRecord.playmonth = scheduleRecord.playmonth
            newRecord.visitteam = scheduleRecord.visitteam
            newRecord.visitwins = 0
            
            print 'copying schedule for ' + scheduleRecord.visitteam.nickname + ' at ' + scheduleRecord.hometeam.nickname  
            
            newRecord.save()
            
#updater = ScheduleUpdater()
#updater.copySchedule(2014, 2015)
        
    
    
