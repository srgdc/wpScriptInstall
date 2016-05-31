echo "================================================================="
echo "Apache2 Installation and Configuration!"
echo "================================================================="

#Install en root apache2
${cmdSudo} apt-get install -y apache2
#Activate mod_rewriting
${cmdSudo} a2enmod rewrite

#Create the folder for the installation of the company website and apply permissions
${cmdSudo} mkdir -p /var/www/${siteName}
${cmdSudo} chown vagrant:vagrant /var/www/${siteName}
#TODO: Set permissions for user ine the server environment

#Create a back-up of the default configuration
${cmdSudo} cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.back
#Replace /var/www/html by /var/www/${siteName} in the file configuration of the available sites -> Allow to link the IP address to the ${siteName} folder
${cmdSudo} sed -i -e "s@/var/www/html@/var/www/${siteName}@g" /etc/apache2/sites-available/000-default.conf

#TODO: Check error apache2 --version

#Restart apache2
${cmdSudo} service apache2 restart
