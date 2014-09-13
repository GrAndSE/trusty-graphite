#!/bin/sh

# create conf files from examples
cd /opt/graphite/conf/
sudo cp graphite.wsgi.example graphite.wsgi
sudo cp carbon.conf.example carbon.conf
sudo cp storage-schemas.conf.example storage-schemas.conf

# configure graphite (python) settings
cd /opt/graphite/webapp/graphite/
sudo cp local_settings.py.example local_settings.py
sudo sed -i 's/#TIME_ZONE/TIME_ZONE/;s/America\/Los_Angeles/America\/New_York/' local_settings.py
sudo sed -i 's/#SECRET_KEY/SECRET_KEY/;s/UNSAFE_DEFAULT/1070b856de49b101538547b65c8d8c51/' local_settings.py

# configure apache to load the wsgi application
cd /etc/apache2/sites-available/
sudo cp /opt/graphite/examples/example-graphite-vhost.conf graphite-vhost.conf

cd /etc/apache2/sites-enabled/
sudo unlink 000-default.conf && sudo ln -s ../sites-available/graphite-vhost.conf 000-graphite.conf
sudo mkdir /var/run/apache2/wsgi
sudo sed -i 's/WSGISocketPrefix run\/wsgi/WSGISocketPrefix \/var\/run\/apache2\/wsgi/' 000-graphite.conf

echo "Edit 000-graphite.conf and follow directions after remaining XXXs"

# create convenience link in ~
cd
ln -s /opt/graphite/storage/log/webapp webapp_logs