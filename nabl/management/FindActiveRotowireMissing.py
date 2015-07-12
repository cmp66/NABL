__author__ = 'carlphil'

from nabl.nabladmin.models import Rotowiremissing
from nabl.management.bbref import SiteSearch


queryset = Rotowiremissing.objects.all().distinct('playername').order_by('playername')
search = SiteSearch()


for missing_player in queryset:
    possibleHits = search.playerSearch(missing_player.playername)

    if len(possibleHits) > 0:
        print 'found hit for player: ' + missing_player.playername

        missingRecords = Rotowiremissing.objects.filter(playername=missing_player.playername)
        for record in missingRecords:
            record.active_mlb = 1
            record.save()
