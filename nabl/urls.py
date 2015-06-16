from django.conf.urls.defaults import patterns, include, url
#from django_restapi.model_resource import Collection
#from django_restapi.responder import *
#from django_restapi.receiver import *
from rest.api import MembersResource
from rest.api import RotowiremissingResource
from rest.api import PlayersResource
from nabladmin import adminresources
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from nabl.site import views
from tastypie.api import Api

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

members_resource = MembersResource()

v1_api = Api(api_name='v1')
v1_api.register(RotowiremissingResource())
v1_api.register(PlayersResource())
v1_api.register(MembersResource())

#members_resource = Collection(
#    queryset = Members.objects.all(),
#    permitted_methods = ('GET', 'POST', 'PUT', 'DELETE'),
#    responder = XMLResponder(),
#    receiver = XMLReceiver()
#)

#json_members_resource = Collection(
#    queryset = Members.objects.all(),
#    permitted_methods = ('GET', 'POST', 'PUT', 'DELETE'),
#    responder = JSONResponder(),
#    receiver = JSONReceiver()
#)

urlpatterns = patterns('',
    # Example:
    # (r'^nabl/', include('nabl.foo.urls')),

    # Uncomment the admin/doc line below and add 'django.contrib.admindocs' 
    # to INSTALLED_APPS to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    #url(r'^nabl/admin/', include(admin.site.urls)),
    #(r'^admin/', admin.site.urls),
#    (r'^nabladmin/admin/', admin.site.urls),
    (r'^api/', include(v1_api.urls)),
    #(r'^api/', include(rotowiremissing_resource.urls)),    
    url(r'nabl/admin.html', 'nabl.site.views.admin'),
    url(r'nabl/rotowireSearch', 'nabl.site.views.rotowireSearch')
#    (r'^xml/members/(.*?)/?$', members_resource),
#    (r'^json/members/(.*?)/?$', json_members_resource)
)

#urlpatterns += staticfiles_urlpatterns()
