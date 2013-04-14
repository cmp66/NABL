import os
import sys

sys.path.append('/usr/local/apps')
sys.path.append('/usr/local/apps/nabl')

os.environ['DJANGO_SETTINGS_MODULE'] = 'nabl.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
