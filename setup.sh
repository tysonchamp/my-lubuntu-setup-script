#!/bin/bash
#
# Auto Ubuntu Web Server Setup Script
# 
# Copyright 2014 tysonchamp <tyson.granger181@gmail.com>
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# Version 1.1
# 
# Check to see is the user is root
#
if [ $( whoami | grep root | wc -l ) != 1 ];
	then
	echo "You need to be root to properly work this script\n"
	echo "Please switch user to the root user using below command\n"
	echo "sudo su"
	exit 1
fi
# Installing LAMP Stack & pHpMyAdmin
echo "Installing Latest Updates Process starts:"
echo " "
echo "================================================================"
sudo apt-get update && sudo apt upgrade -y
echo " "
echo "LAMP Stack with phpMyAdmin"
echo "Installation Process Starts:"
echo " "
echo "================================================================"
sudo apt-get install apache2 -y
echo "================================================================"
sudo apt-get install php php-gd php-common php-curl php-gmp libapache2-mod-php -y && sudo apt-get install mariadb-server -y
echo "================================================================"
# sudo apt-get install phpmyadmin -y
echo "================================================================"
sudo a2enmod rewrite
echo "Setting up Virtual Host Configaration Files"
echo " "
echo "================================================================"
sudo sh httpconf.sh
sudo chown -R www-data:www-data /var/www/*
sudo chmod -R 777 /var/www/*
echo "================================================================"
sudo service apache2 restart
echo "================================================================"
echo "Installing Others Softwares"
echo " "
sudo apt-get install apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text webhttrack curl filezilla -y
sudo snap install postman
echo "================================================================"
echo "Installing Nodejs Softwares"
echo " "
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs gradle openjdk-17-jdk openjdk-17-jre -y
#echo "================================================================"
#echo "Installing Android Studio"
#echo " "
#sudo apt install gradle -y
#sudo npm install -g cordova
#sudo add-apt-repository ppa:maarten-fonville/android-studio
#sudo apt update
#sudo apt install android-studio -y
echo "================================================================"
echo "Installing Mongodb"
echo " "
apt-get install gnupg curl
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo " "
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
# wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
# sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
# wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
# echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo apt install php-pear -y
sudo apt -y install php-mongodb
# sudo service mongod start
echo "================================================================"
echo "Installing Python for Arduino"
echo " "
#sudo apt update
sudo apt install python3 -y
sudo apt install python-is-python3 python3-pip -y
sudo pip3 install pyserial
echo "Installation Complete! If you had any error contact www.tysonchamp.com or"
echo "Open a issue request on https://github.com/tysonchamp/my-lubuntu-setup-script"
echo "Reebot Your system Now!"
#
# Exit clean
#
exit 0
