echo "================================================================="
echo "Wordpress CLI Installation!"
echo "================================================================="

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
${cmdSudo} mv wp-cli.phar /usr/local/bin/wp


