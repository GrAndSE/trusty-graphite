trusty-graphite
===============

A vagrant definition and setup for [Graphite](https://graphite.readthedocs.org/en/latest/index.html) on [Ubuntu Trusty](http://releases.ubuntu.com/14.04/) (x64).

To startup:

1. Install [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org)
1. `git clone https://github.com/jasonnerothin/trusty-graphite.git`
1. `cd trusty-graphite`
1. `vagrant up` 
1. `tar cvzf scripts.tgz scripts`
1. `scp scripts.tgz vagrant@192.168.33.10:~` # password = 'vagrant'
1. `vagrant ssh`
1. `tar xvzf scripts.tgz`
1. `cd scripts`
1. `./installGraphite.sh`
1. `./configureGraphite.sh`
1. `./refresh.sh`
1. Go to [http://192.168.33.10](http://192.168.33.10) in your browser
1. `cd`
1. `cd webapp_logs`
1. `vi error.log`

