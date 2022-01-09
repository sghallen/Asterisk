# Asterisk Installation
Steps for installation of asterisk on a new system:

1) Before getting the installation script, manually run the following commands:
sudo apt-get update
sudo apt-get upgrade
sudo reboot

2) Go to user folder: "cd ~"

3) Clone repo from git using "git clone https://github.com/sghallen/Asterisk.git"

4) Enter local repo: "cd Asterisk"

5) Give ourselves read, write and execute permission:"sudo chmod 755 asterisk_install"

6) Run script as root: "sudo ./asterisk_install"

7) When the asterisk config file opens, manually change the "runuser" and "rungroup" settings under options to the appropriate user (save with :wq)

8) When the empty modules.config file opens, for now save with :wq

9) Should now be able to run asterisk with: "/usr/sbin/asterisk -cvvv"
