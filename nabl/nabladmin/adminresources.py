from nabladmin.models import *
from django.contrib import admin

admin.site.register(Members, MembersAdmin)
admin.site.register(Teams, TeamsAdmin)
admin.site.register(Leagues, LeaguesAdmin)
admin.site.register(Divisions, DivisionsAdmin)
admin.site.register(Transactions, TransactionsAdmin)
admin.site.register(Players, PlayersAdmin)
admin.site.register(Rotowire, RotowireAdmin)
admin.site.register(Rotowiremissing, RotowiremissingAdmin)
admin.site.register(Rosterassign, RosterassignAdmin)
admin.site.register(Rostermove, RostermoveAdmin)
admin.site.register(Teamresults, TeamresultsAdmin)
admin.site.register(Schedules, SchedulesAdmin)
admin.site.register(CardedPlayers, CardedPlayersAdmin)
admin.site.register(Draftpicks, DraftpicksAdmin)
