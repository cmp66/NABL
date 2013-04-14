'''
Created on Mar 24, 2013

@author: carlphil
'''
from nabladmin.models import Players
from django.core.exceptions import ObjectDoesNotExist
import re

def getPlayerByDisplayName(displayName, yearactive):
    return Players.objects.get(displayname__exact=displayName, endyear__exact=yearactive)
    
def getPlayerByFullName(firstname, lastname, yearactive):
    return Players.objects.get(firstname=firstname, lastname=lastname, endyear__exact=yearactive)

if __name__ == '__main__':
    firstname = u'Matt'
    lastname = u'Latos'
    
    #firstname = re.sub(r'\.', '\\\.', firstname)
    
    try:
        player = getPlayerByDisplayName(firstname + ' ' + lastname, 2012)
    except ObjectDoesNotExist:
        print 'cannot found player by display name: ' + firstname + ' ' + lastname
        
    try:
        player = getPlayerByFullName(firstname, lastname, 2012)
    except ObjectDoesNotExist:
        print 'cannot found player by first/last name: ' + firstname + ' ' + lastname