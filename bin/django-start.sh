export DJANGO_SETTINGS_MODULE=nabl.settings.dev_settings
source ~/Projects/nabl/venv/bin/activate
export PYTHONPATH=$PYTHONPATH:~/Projects/NABL
python -B manage.py runfcgi host=127.0.0.1 port=8001 --settings=nabl.settings.dev_settings
