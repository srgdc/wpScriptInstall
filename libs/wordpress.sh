echo "================================================================="
echo "Wordpress Installation!"
echo "================================================================="

# download the WordPress core files
${cmdSudo} -u vagrant -i -- wp core download --locale=fr_FR --path="/var/www/${siteName}"

# create the wp-config file
${cmdSudo} -u vagrant -i -- wp core config --dbname=${dbName} --dbuser=${dbUser} --dbpass=${userPassword} --path="/var/www/${siteName}"

# create database, and install WordPress
${cmdSudo} -u vagrant -i -- wp db create --path="/var/www/${siteName}"
${cmdSudo} -u vagrant -i -- wp core install --url="http://192.168.56.10/" --title="${siteName}" --admin_user="${wpName}" --admin_password="${wpPassword}" --admin_email="${wpEmail}" --skip-email --path="/var/www/${siteName}"

# install the theme chosen or let the default
echo "Do you want a special theme ? (you need to tell us the exact name) enter the name directly"
read theme

if [ -n "$theme" ]; then
  #Install the new theme
  ${cmdSudo} -u vagrant -i -- wp theme install $theme --activate --path="/var/www/${siteName}"
fi
#else the theme is the default one
# Delete theme which are inactive once the user chose the theme he wants
sudo -u vagrant -i -- wp theme delete $(wp theme list --status=inactive --fields=name) --path="/var/www/${siteName}" --allow-root
# BUG ICI PAS DE SUPPRESSION

# install plugin to secure wordfence
${cmdSudo} -u vagrant -i -- wp plugin install wordfence --activate --path="/var/www/${siteName}"
sudo -u vagrant -i -- wp plugin delete $(wp plugin list --status=inactive --fields=name) --path="/var/www/${siteName}" --allow-root
# BUG ICI PAS DE SUPPRESSION

#remove readme.html
${cmdSudo} rm -f /var/www/${siteName}/readme.*
