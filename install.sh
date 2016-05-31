#!/bin/bash

#########################################################################################
# THIS SCRIPT WILL ERASE ALL THE CONFIGURATION OF YOUR SERVER (APACHE, PHP, MYSQL)      #
# AND INSTALL A CLEAN ONE IN /VAR/WWW/HTML THAT YOU WILL RUN ON YOUR IP SERVER ADDRESS  #
# IN AUTOMATIC INSTALL OR ON YOUR DOMAIN NAME IN MANUAL INSTALL                         #
#########################################################################################

# Test if user is root
if [ "$UID" -ne "0" ]
then
  echo "This must be launch by the super user !"
  exit 1
fi

cmdSudo='command'
command type -f 'sudo' &> /dev/null && cmdSudo='sudo'

# If problems during installation, check this file in your home directory and call us
echo '' > "/${HOME}/installation.log"
${cmdSudo} chmod 600 "${HOME}/installation.log"

echo "================================================================="
echo "Website Installation and Configuration !"
echo "================================================================="

current_dir="$(dirname "$0")"

#execute Apache installation and send error in the installation.log error file

echo "Tell us if you want a manual setup of your website or not (y/n)"
read answer

if echo "$answer" | grep -iq "^y"; then
  echo "================================================================="
	echo "Website name:"
	read siteName
  echo "================================================================="
  echo "MYSQL"
  echo "Password of the superUser MySQL:"
	read rootPassword
  echo "Database Name of WordPress:"
	read dbName
  echo "Username of the user of the database $dbName: "
	read dbUser
  echo "Password of the user $dbUser :"
	read userPassword
  echo "================================================================="
  echo "WORDPRESS"
  echo "Name of the superUser of $siteName"
	read wpName
  echo "Password of the superUser $wpName"
	read wpPassword
  echo "Email of the superUser of $wpName"
	read wpEmail
  echo "================================================================="
  echo "Thank you ! Just wait now :)"
else
	siteName='default'
	rootPassword='admin'
	dbName='wordpress'
	dbUser='wordpress'
	userPassword='wordpress'
	wpName='admin'
	wpPassword='admin'
	wpEmail='admin@admin.com'
fi

source "$current_dir/libs/uninstall.sh" 2>> "${HOME}/installation.log"
source "$current_dir/libs/apache.sh" 2>> "${HOME}/installation.log"
source "$current_dir/libs/php5.sh" 2>> "${HOME}/installation.log"
source "$current_dir/libs/mysql.sh" 2>> "${HOME}/installation.log"
source "$current_dir/libs/wp_cli.sh" 2>> "${HOME}/installation.log"
source "$current_dir/libs/wordpress.sh" 2>> "${HOME}/installation.log"
source "$current_dir/libs/summary.sh" 2>> "${HOME}/installation.log"

echo "-----------------------"
echo "END OF THE INSTLLATION"
exit 0
