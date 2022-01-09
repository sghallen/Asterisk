#! /bin/bash

# install and restart Network Time Protocol (NTP) daemon
apt-get install ntp
/etc/init.d/ntp restart

# make directory for asterisk source code
mkdir -p ~/src/asterisk-complete/asterisk
cd ~/src/asterisk-complete/asterisk

# for below command, might be good to add variable for version number (18 in this case)
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz
tar zxvf asterisk-18-current.tar.gz

# also every time 18.9.0 appears, may want another variable there
# go to script to install prerequisite software required to run asterisk
cd asterisk-18.9.0/contrib/scripts
./install_prereq install

# make source code
cd ~/src/asterisk-complete/asterisk/asterisk-18.9.0
./configure
make
make install
make config

# change file permissions to match those of the user we’ll be running as
chown -R asteriskpbx:asteriskpbx /var/lib/asterisk/
chown -R asteriskpbx:asteriskpbx /var/spool/asterisk/
chown -R asteriskpbx:asteriskpbx /var/log/asterisk/
chown -R asteriskpbx:asteriskpbx /var/run/asterisk/
mkdir -p /etc/asterisk/
chown asteriskpbx:asteriskpbx /etc/asterisk/

#copy sample config files
cp ~/src/asterisk-complete/asterisk/asterisk-18.9.0/configs/samples/indications.conf.sample /etc/asterisk/indications.conf
cp ~/src/asterisk-complete/asterisk/asterisk-18.9.0/configs/samples/asterisk.conf.sample /etc/asterisk/asterisk.conf

#open the asterisk config file and manually change the runuser and rungroup variables to the appropriate user (save with :wq)
vim /etc/asterisk/asterisk.conf
echo "asterisk.conf edited"
#create empty modules.conf file (save with :wq)
vim /etc/asterisk/modules.conf
echo "empty config file created"
#should be able to run asterisk with /usr/sbin/asterisk -cvvv
echo "run asterisk with /usr/sbin/asterisk -cvvv"
