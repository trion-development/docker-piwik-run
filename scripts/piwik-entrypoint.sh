#!/bin/bash
set -e

if [ ! -e piwik.php ]; then
	tar cf - --one-file-system -C /usr/src/piwik . | tar xf -
	chown -R www-data .
fi

CONFIG_FILE=/var/www/html/config/config.ini.php

if [ ! -f $CONFIG_FILE ]; then
  /scripts/piwik-init.sh
fi

exec "$@"
