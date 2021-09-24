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
sudo apt-get install sublime-text webhttrack curl -y
echo "================================================================"
echo "Installing Nodejs Softwares"
echo " "
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs gradle default-jdk -y
sudo npm install -g cordova
echo "================================================================"
echo "Installing Android Studio"
echo " "
sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt update
sudo apt install android-studio
echo "Installation Complete! If you had any error contact www.tysonchamp.com or"
echo "Open a issue request on https://github.com/tysonchamp/my-lubuntu-setup-script"
echo "Reebot Your system Now!"
#
# Exit clean
#
exit 0
