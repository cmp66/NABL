'''
Created on Feb 10, 2012

@author: cphillips
'''
from nabl.management.bbref import SiteSearch
from django.utils import simplejson
import re

playerData = SiteSearch().playerSearch("Bob Smith")
print playerData

