#!/bin/sh

sed -i 's/DOMAIN/'"$DOMAIN"'/g' inc/config.php
sed -i 's/MYSQL_ROOT_PASSWORD/'"$MYSQL_ROOT_PASSWORD"'/g' inc/config.php
exec "$@"
