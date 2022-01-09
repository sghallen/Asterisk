# Asterisk Installation
Before running the script, manually run the following commands:
sudo apt-get update
sudo apt-get upgrade
sudo reboot

Give ourselves read, write and execute permission:
sudo chmod 755 asterisk_install
Run script as root:
sudo ./asterisk_install

When the asterisk config file opens, manually change the runuser and rungroup variables to the appropriate user (save with :wq)
