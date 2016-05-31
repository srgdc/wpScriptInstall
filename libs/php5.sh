echo "================================================================="
echo "PHP5 Installation!"
echo "================================================================="

#Install en root de php5, module for apache2 of php5 and (php5-cli & php5-curl) for wp-cli.phar
${cmdSudo} apt-get install -y php5-common libapache2-mod-php5 php5-cli php5-curl php5-mysql

#Restart apache2 
${cmdSudo} service apache2 restart
