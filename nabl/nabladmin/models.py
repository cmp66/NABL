from django.db import models
from django.contrib import admin


class Members(models.Model):
    id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=255)
    lastname = models.CharField(max_length=255)
    streetaddress1 = models.CharField(max_length=255)
    streetaddress2 = models.CharField(max_length=255)
    city = models.CharField(max_length=255)
    state = models.CharField(max_length=255)
    zipcode = models.CharField(max_length=255)
 
    class Meta:
        db_table = u'members'
        verbose_name = u'Member'
        verbose_name_plural = u'Members'
       
    def __unicode__(self):
        return self.firstname + ' ' + self.lastname

class Phonenumbers(models.Model):
    id = models.AutoField(primary_key=True)
    memberid = models.ForeignKey(Members, db_column='memberid')
    phonenumber = models.CharField(max_length=25)
    workorhome = models.CharField(max_length=2) # This field type is a guess.

    class Meta:
        db_table = u'phonenumbers'
        verbose_name = u'Phonenumber'
        verbose_name_plural = u'Phonenumbers'
        
    def __unicode__(self):
        return self.phonenumber

class PhonenumbersInline(admin.TabularInline):
    model = Phonenumbers
    extra=0

class Emailaddresses(models.Model):
    id = models.AutoField(primary_key=True)
    memberid = models.ForeignKey(Members, db_column='memberid')
    address = models.CharField(max_length=64)
    primaryaddress = models.CharField(max_length=2) # This field type is a guess.
 
    class Meta:
        db_table = u'emailaddresses'
        verbose_name = u'Email Address'
        verbose_name_plural = u'Emails Addresses'
        
    def __unicode__(self):
        return self.address

class EmailaddressesInline(admin.TabularInline):
    model = Emailaddresses
    extra=0

class MembersAdmin(admin.ModelAdmin):
    inlines = [ PhonenumbersInline, EmailaddressesInline]
    fields = ['firstname', 'lastname', 'streetaddress1', 'city', 'state', 'zipcode']
    list_display = ('firstname', 'lastname', 'streetaddress1', 'city', 'state', 'zipcode')
    search_fields = ['lastname']


class Teams(models.Model):
    id = models.IntegerField(primary_key=True)
    city = models.CharField(max_length=255)
    nickname = models.CharField(max_length=255)
    memberid = models.ForeignKey(Members, db_column='memberid')
    predecessor = models.IntegerField()

    class Meta:
        db_table = u'teams'
        ordering = ["city"]
        verbose_name = u'Team'
        verbose_name_plural = u'Teams'
        
    def __unicode__(self):
        return self.city + ' ' + self.nickname
        
class TeamsAdmin(admin.ModelAdmin):
    fields = ['id', 'city', 'nickname', 'memberid', 'predecessor']
    list_display = ('id', 'city', 'nickname', 'memberid', 'predecessor')
    search_fields = ['memberid', 'city']


class Transactions(models.Model):
    id = models.IntegerField(primary_key=True)
    type = models.IntegerField()
    transdate = models.DateTimeField()
    team1 = models.IntegerField()
    team2 = models.IntegerField()

    class Meta:
        db_table = u'transactions'
        verbose_name = u'Transaction'
        verbose_name_plural = u'Transactions'
        
    def __unicode__(self):
        return str(self.id)

class TransactionsAdmin(admin.ModelAdmin):
    fields = ['type', 'transdate', 'team1', 'team2']
    list_display = ('type', 'transdate', 'team1', 'team2')
    search_fields = ['type', 'team1']

class Leagues(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)

    class Meta:
        db_table = u'leagues'
        verbose_name = u'League'
        verbose_name_plural = u'Leagues'
        
    def __unicode__(self):
        return self.name

class LeaguesAdmin(admin.ModelAdmin):
    fields = ['name']
    #list_display = ('name')
    
class Divisions(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    leagueid = models.ForeignKey(Leagues, db_column='leagueid')
    
    class Meta:
        db_table = u'divisions'
        verbose_name = u'Division'
        verbose_name_plural = u'Divisions'
        
    def __unicode__(self):
        return self.name
        
class DivisionsAdmin(admin.ModelAdmin):
    fields = ['name', 'leagueid']
    list_display = ('name', 'leagueid')

class Players(models.Model):
    id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=32)
    lastname = models.CharField(max_length=32)
    displayname = models.CharField(max_length=32)
    startyear = models.IntegerField()
    endyear = models.IntegerField()
    bbreflink = models.CharField(max_length=128)
    rotowireid = models.CharField(max_length=16)
    position = models.CharField(max_length=8)
    bats = models.CharField(max_length=8)
    throwhand = models.CharField(max_length=8)
    birthdate = models.CharField(max_length=24)
    
    class Meta:
        db_table = u'players'
        verbose_name = u'Player'
        verbose_name_plural = u'Players'
        ordering = ['displayname']
        
    def __unicode__(self):
        return self.displayname

class PlayersAdmin(admin.ModelAdmin):
    fields = ['firstname', 'lastname', 'displayname', 'startyear', 'endyear', 'bbreflink', 'position']
    list_display = ('id', 'firstname', 'lastname', 'displayname', 'startyear', 'endyear', 'bbreflink', 'position')
    search_fields = ['firstname', 'lastname', 'displayname', 'position', 'bbreflink']

class CardedPlayers(models.Model):
    id = models.AutoField(primary_key=True)
    playername = models.CharField(max_length=64)
    season = models.IntegerField()
    player = models.ForeignKey(Players, db_column='playerid')
    mlbteam = models.CharField(max_length=64)
    
    class Meta:
        db_table = u'cardedplayers'
        verbose_name = u'Carded Player'
        verbose_name_plural = u'Carded Players'
        
    def __unicode__(self):
        return self.playername
      
class CardedPlayersAdmin(admin.ModelAdmin):
    fields = ['playername', 'season', 'mlbteam']
    list_display = ('id', 'playername', 'season', 'mlbteam')
    search_fields = ['season', 'playername', 'mlbteam']
        

class Rotowire(models.Model):
    id = models.AutoField(primary_key=True)
    player = models.ForeignKey(Players, db_column='player')
    mlbteam = models.CharField(max_length=32)
    reportdate = models.DateTimeField()
    news = models.TextField(max_length=2048)
    comment = models.TextField(max_length=2048)
    
    class Meta:
        db_table = u'rotowire'
        verbose_name = u'Rotowire Record'
        verbose_name_plural = u'Rotowire Records'

class RotowireAdmin(admin.ModelAdmin):
    fields = ['player', 'mlbteam', 'reportdate', 'news', 'comment']
    list_display = ('player', 'mlbteam', 'reportdate',)
    search_fields = ['player__displayname', 'reportdate',]
  
class Rotowiremissing(models.Model):
    id = models.AutoField(primary_key=True)
    playername = models.CharField(max_length=128)
    mlbteam = models.CharField(max_length=32)
    reportdate = models.DateTimeField()
    news = models.TextField(max_length=2048)
    comment = models.TextField(max_length=2048)
    
    class Meta:
        db_table = u'rotowiremissing'
        verbose_name = u'Missing Rotowire Record'
        verbose_name_plural = u'Missing Rotowire Records'
        
class RotowiremissingAdmin(admin.ModelAdmin):
    fields = ['playername', 'mlbteam', 'reportdate', 'news', 'comment']
    list_display = ('playername', 'mlbteam', 'reportdate',)
    search_fields = ['playername', 'reportdate',]

class Idgen(models.Model):
    nextval = models.IntegerField()
    
    class Meta:
        db_table = u'idgen'

class Draftorder(models.Model):
    teamlist = models.CharField(max_length=255)
    draftyear = models.IntegerField(primary_key=True)
    
    class Meta:
        db_table = u'draftorder'

class Assignments(models.Model):
    id = models.AutoField(primary_key=True)
    playerid = models.ForeignKey(Players, db_column='playerid')
    teamid = models.ForeignKey(Teams, db_column='teamid')
    transactionid = models.ForeignKey(Transactions, db_column='transactionid')
    
    class Meta:
        db_table = u'assignments'
        verbose_name = u'Assignment'
        verbose_name_plural = u'Assignments'
        
class AssignmentsAdmin(admin.ModelAdmin):
    fields = ['playerid', 'teamid', 'transactionid']
    list_display = ('playerid', 'teamid', 'transactionid')
    search_fields = ['playerid__displayname', 'teamid__name', 'transactionid__id']

class Draftpicks(models.Model):
    pickid = models.AutoField(primary_key=True)
    draftyear = models.IntegerField()
    slotteam = models.ForeignKey(Teams, db_column='slotteam')
    ownerteam = models.IntegerField()
    playerid = models.IntegerField()
    #playerid = models.ForeignKey(Players, db_column='playerid')
    round = models.IntegerField()
    
    class Meta:
        db_table = u'draftpicks'
        verbose_name = u'Draft Pick'
        verbose_name_plural = u'Draft Picks'
        
class DraftpicksAdmin(admin.ModelAdmin):
    fields = ['draftyear', 'slotteam', 'ownerteam', 'playerid', 'round']
    list_display = ('draftyear', 'slotteam', 'ownerteam', 'playerid', 'draftyear', 'round')
    search_fields = ['slotteam__name', 'playerid__displayname', 'ownerteam', 'round']
    list_filter = ('draftyear',)

MONTH_CHOICES = (
    (5, 'May'),
    (6, 'Jun'),
    (7, 'Jul'),
    (8, 'Aug'),
    (9, 'Sept'),
    (10, 'Oct'),
    (11, 'Nov'),
    (12, 'Dec'),
    (13, 'Jan'),
)

MONTHIDX_CHOICES = (
    (1, 1),
    (2, 2),
    (3, 3),
)


class Schedules(models.Model):
    year = models.IntegerField(default='2010')
    hometeam = models.ForeignKey(Teams, related_name='hometeam', db_column='hometeam')
    visitteam = models.ForeignKey(Teams, related_name='visitteam', db_column='visitteam')
    seriesid = models.AutoField(primary_key=True)
    homewins = models.IntegerField(default='0')
    visitwins = models.IntegerField(default='0')
    numgames = models.IntegerField(default='3')
    dateplayed = models.DateTimeField()
    playmonth = models.IntegerField(choices=MONTH_CHOICES)
    monthidx = models.IntegerField(choices=MONTHIDX_CHOICES)
    
    class Meta:
        db_table = u'schedules'
        verbose_name = u'Schedule'
        verbose_name_plural = u'Schedules'

class SchedulesAdmin(admin.ModelAdmin):
    fields = ['year', 'hometeam', 'visitteam', 'playmonth', 'monthidx', 'numgames', 'homewins', 'visitwins',]
    list_filter = ('year',)
    list_display = ('seriesid', 'year', 'hometeam', 'visitteam', 'playmonth', 'monthidx', 'numgames',)
    search_fields = ['hometeam__nickname', 'visitteam__nickname', 'playmonth']

class Gameresults(models.Model):
    id = models.AutoField(primary_key=True)
    scheduleid = models.ForeignKey(Schedules, db_column='scheduleid')
    gamenumber = models.IntegerField()
    homepitcher = models.IntegerField()
    visitpitcher = models.IntegerField()
    homeruns = models.IntegerField()
    visitruns = models.IntegerField()
    comment = models.CharField(max_length=8000)
    
    class Meta:
        db_table = u'gameresults'

class Playercuts(models.Model):
    playerid = models.ForeignKey(Players, primary_key=True, db_column='playerid')
    season = models.IntegerField()
    teamid = models.ForeignKey(Teams, db_column='teamid')
    
    class Meta:
        db_table = u'playercuts'

class Rosterassign(models.Model):
    id = models.AutoField(primary_key=True)
    playerid = models.ForeignKey(Players, db_column='playerid')
    teamid = models.ForeignKey(Teams, db_column='teamid')
    year = models.IntegerField()
    
    class Meta:
        db_table = u'rosterassign'
        verbose_name = u'Roster Assignment'
        verbose_name_plural = u'Roster Assignments'

class RosterassignAdmin(admin.ModelAdmin):
    fields = ['playerid', 'teamid', 'year']
    list_filter = ('teamid',)
    list_display = ('id', 'playerid', 'teamid', 'year')
    search_fields = ['playerid__displayname', 'year']

class Rostermove(models.Model):
    id = models.AutoField(primary_key=True)
    type = models.IntegerField()
    teamid = models.ForeignKey(Teams, db_column='teamid')
    transactionid = models.ForeignKey(Transactions, db_column='transactionid')
    resourcetype = models.IntegerField()
    resourceid = models.IntegerField()
    
    class Meta:
        db_table = u'rostermove'
        verbose_name = u'Transaction Item'
        verbose_name_plural = u'Transaction Items'

class RostermoveAdmin(admin.ModelAdmin):
    fields = ['type', 'teamid', 'transactionid', 'resourcetype', 'resourceid']
    list_display = ('id', 'type', 'teamid', 'transactionid', 'resourcetype', 'resourceid')
    search_fields = ['type', 'teamid__name', 'transactionid__id']

class Rosters(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    season = models.IntegerField()
    teamid = models.ForeignKey(Teams, db_column='teamid')
    
    class Meta:
        db_table = u'rosters'

class Rosterslot(models.Model):
    rosterid = models.ForeignKey(Teams, db_column='rosterid')
    playerid = models.ForeignKey(Players, primary_key=True, db_column='playerid')
    
    class Meta:
        db_table = u'rosterslot'

class Seriesstatrecords(models.Model):
    id = models.IntegerField(primary_key=True)
    series = models.ForeignKey(Schedules, db_column='series')
    season = models.IntegerField()
    reportingteamid = models.ForeignKey(Teams, related_name='reportteam', db_column='reportingteamid')
    statsteamid = models.ForeignKey(Teams, related_name='statsteam', db_column='statsteamid')
    playerid = models.ForeignKey(Players, db_column='playerid')
    games = models.IntegerField()
    bat_ab = models.IntegerField()
    bat_runs = models.IntegerField()
    bat_hits = models.IntegerField()
    bat_rbi = models.IntegerField()
    bat_hr = models.IntegerField()
    bat_doubles = models.IntegerField()
    bat_triples = models.IntegerField()
    bat_walks = models.IntegerField()
    bat_strikeouts = models.IntegerField()
    bat_sb = models.IntegerField()
    bat_cs = models.IntegerField()
    errors = models.IntegerField()
    pitch_gs = models.IntegerField()
    pitch_cg = models.IntegerField()
    pitch_sho = models.IntegerField()
    pitch_wins = models.IntegerField()
    pitch_loss = models.IntegerField()
    pitch_save = models.IntegerField()
    pitch_ip = models.IntegerField()
    pitch_hits = models.IntegerField()
    pitch_er = models.IntegerField()
    pitch_walks = models.IntegerField()
    pitch_strikeouts = models.IntegerField()
    pitch_hr = models.IntegerField()
    pitch_ipfull = models.IntegerField()
    pitch_ipfract = models.IntegerField()
    bat_hbp = models.IntegerField()
    pitch_gp = models.IntegerField()
    pitch_runs = models.IntegerField()
    
    class Meta:
        db_table = u'seriesstatrecords'

class Statrecords(models.Model):
    id = models.IntegerField(primary_key=True)
    playerid = models.ForeignKey(Players, db_column='playerid')
    season = models.IntegerField()
    teamid = models.ForeignKey(Teams, db_column='teamid')
    games = models.IntegerField()
    bat_ab = models.IntegerField()
    bat_runs = models.IntegerField()
    bat_hits = models.IntegerField()
    bat_rbi = models.IntegerField()
    bat_hr = models.IntegerField()
    bat_doubles = models.IntegerField()
    bat_triples = models.IntegerField()
    bat_walks = models.IntegerField()
    bat_strikeouts = models.IntegerField()
    bat_sb = models.IntegerField()
    bat_cs = models.IntegerField()
    errors = models.IntegerField()
    pitch_gs = models.IntegerField()
    pitch_cg = models.IntegerField()
    pitch_sho = models.IntegerField()
    pitch_wins = models.IntegerField()
    pitch_loss = models.IntegerField()
    pitch_save = models.IntegerField()
    pitch_ip = models.IntegerField()
    pitch_hits = models.IntegerField()
    pitch_er = models.IntegerField()
    pitch_walks = models.IntegerField()
    pitch_strikeouts = models.IntegerField()
    pitch_hr = models.IntegerField()
    pitch_ipfull = models.IntegerField()
    pitch_ipfract = models.IntegerField()
    bat_hbp = models.IntegerField()
    pitch_gp = models.IntegerField()
    pitch_runs = models.IntegerField()
    
    class Meta:
        db_table = u'statrecords'

class Teamresults(models.Model):
    id = models.AutoField(primary_key=True)
    teamid = models.ForeignKey(Teams, db_column='teamid')
    divisionid = models.ForeignKey(Divisions, db_column='divisionid')
    year = models.IntegerField()
    leagueid = models.ForeignKey(Leagues, db_column='leagueid')
    won = models.IntegerField()
    lost = models.IntegerField()
    divisionwin = models.IntegerField(default=0)
    divisionloss = models.IntegerField(default=0)
    divisiontitle = models.IntegerField(default=0)
    worldseriesapp = models.IntegerField(default=0)
    worldserieswin = models.IntegerField(default=0)
    
    class Meta:
        db_table = u'teamresults'
        verbose_name='Team Result'
        verbose_name_plural='Team Results'

class TeamresultsAdmin(admin.ModelAdmin):
    fields = ['teamid', 'divisionid', 'year', 'leagueid', 'won', 'lost']
    list_display = ('teamid', 'divisionid', 'year', 'leagueid', 'won', 'lost')
    search_fields = ['teamid__nickname', 'divisionid__name', 'year',]
    
