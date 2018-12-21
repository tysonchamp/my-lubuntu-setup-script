#!/bin/bash
if [ -e /etc/apache2/sites-available/000-default.conf.backup ]
	then
		if [ -e /etc/apache2/sites-available/000-default.conf ]
			then
			echo "<VirtualHost *:80>" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		ServerAdmin admin@localhost" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		DocumentRoot /var/www/html" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		ServerName localhost" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    <Directory /var/www/>" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    Options Indexes FollowSymLinks MultiViews" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    # changed from None to FileInfo" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    AllowOverride FileInfo" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    Order allow,deny" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    allow from all" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    </Directory>" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		DirectoryIndex index.php" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		ErrorLog ${APACHE_LOG_DIR}/error.log" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		CustomLog ${APACHE_LOG_DIR}/access.log combined" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "</VirtualHost>" | cat >> /etc/apache2/sites-available/000-default.conf
			else
			touch /etc/apache2/sites-available/000-default.conf
			echo "<VirtualHost *:80>" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		ServerAdmin admin@localhost" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		DocumentRoot /var/www/html" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    <Directory /var/www/>" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    Options Indexes FollowSymLinks MultiViews" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    # changed from None to FileInfo" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    AllowOverride FileInfo" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    Order allow,deny" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    allow from all" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "	    </Directory>" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		ServerName localhost" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		DirectoryIndex index.php" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		ErrorLog ${APACHE_LOG_DIR}/error.log" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "		CustomLog ${APACHE_LOG_DIR}/access.log combined" | cat >> /etc/apache2/sites-available/000-default.conf
			echo "</VirtualHost>" | cat >> /etc/apache2/sites-available/000-default.conf
		fi
	else
		mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.backup
		touch /etc/apache2/sites-available/000-default.conf
		echo "<VirtualHost *:80>" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "		ServerName localhost" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "		ServerAdmin admin@localhost" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "		DocumentRoot /var/www/html" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "	    <Directory /var/www/>" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "	    Options Indexes FollowSymLinks MultiViews" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "	    # changed from None to FileInfo" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "	    AllowOverride FileInfo" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "	    Order allow,deny" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "	    allow from all" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "	    </Directory>" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "		DirectoryIndex index.php" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "		ErrorLog ${APACHE_LOG_DIR}/error.log" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "		CustomLog ${APACHE_LOG_DIR}/access.log combined" | cat >> /etc/apache2/sites-available/000-default.conf
		echo "</VirtualHost>" | cat >> /etc/apache2/sites-available/000-default.conf
fi

service apache2 restart
