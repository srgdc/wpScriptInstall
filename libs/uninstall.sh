#Uninstall apache2 and configuration files for a clean install
echo "================================================================="
echo "Uninstallation for a new clean one !!!"
echo "================================================================="
#Remove and uninstall apache2
${cmdSudo} apt-get remove -y --purge apache2
#Remove and uninstall php5 and his dependencies
${cmdSudo} apt-get remove -y php5-common libapache2-mod-php5 php5-cli php5-curl php5-mysql
#Remove, uninstall and purge mysql-server and his dependencies
${cmdSudo} apt-get remove -y --purge mysql-server mysql-client mysql-common
#Command to remove and clean everything
${cmdSudo} apt-get autoremove -y
${cmdSudo} apt-get autoclean -y
#Delete all folders and files about mysql (allow to delete database too)


${cmdSudo} rm -rf /var/lib/mysql
${cmdSudo} rm -rf /etc/mysql*
${cmdSudo} rm -rf /etc/apache2*

${cmdSudo} rm -f /usr/local/bin/wp
