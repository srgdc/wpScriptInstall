echo "================================================================="
echo "MySQL Installation and Configuration!"
echo "================================================================="
#Allow to set some configuration before the installation of mysql-server
${cmdSudo} apt-get install debconf-utils
#Configuration of the root password
${cmdSudo} debconf-set-selections <<< "mysql-server mysql-server/root_password password ${rootPassword}"
${cmdSudo} debconf-set-selections <<< "mysql-server mysql-server/root_password_again password ${rootPassword}"

#Install en root de mySQL-server
${cmdSudo} apt-get install -y mysql-server

#Create database for wordpress and unique user for this database
echo "CREATE USER '${dbUser}'@'localhost' IDENTIFIED BY '${userPassword}'; GRANT ALL ON ${dbName}.* TO '${dbUser}'@'localhost'; FLUSH PRIVILEGES;" | ${cmdSudo} mysql -uroot -p${rootPassword}

#Restart apache2
${cmdSudo} service apache2 restart
