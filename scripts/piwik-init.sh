#!/bin/bash

CONFIG_FILE=/var/www/html/config/config.ini.php

cat > /usr/local/etc/php-fpm.d/zz-allow-all-extensions.conf <<EOF
[www]
security.limit_extensions =
EOF

if [ ! -f $CONFIG_FILE ]; then
  echo "; <?php exit; ?> DO NOT REMOVE THIS LINE
; file automatically generated or modified by Piwik; you can manually override the default values in global.ini.php by redefining them in this file.
[database]
host = \"$DB_HOST\"
port = 3306
username = \"$DB_USER\"
password = \"$DB_PASSWORD\"
dbname = \"$DB_DATABASE\"
tables_prefix = \"piwik_\"
adapter = \"PDO\MYSQL\"
type = \"InnoDB\"
schema = \"Mysql\"" > $CONFIG_FILE
fi

echo "Done setting up piwik config..."
chown www-data:www-data $CONFIG_FILE

echo "Waiting for mysql..."
sleep 20

echo "Upgrading schema..."
php console core:update --yes

echo "Fixing permissions..."
chown -R www-data:www-data /var/www/html
