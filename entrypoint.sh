#!/bin/sh

sed -i 's/DOMAIN/'"$DOMAIN"'/g' inc/config.php
exec "$@"
