export DJANGO_SETTINGS_MODULE=nabl.settings.prod_settings
export PYTHONPATH=$PYTHONPATH:~/root
python -B manage.py runfcgi host=127.0.0.1 port=8001 --settings=nabl.settings.prod_settings
