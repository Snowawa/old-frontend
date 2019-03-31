FROM composer
WORKDIR /old-frontend
COPY . .

RUN composer install

ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "php", "index.php" ]

FROM richarvey/nginx-php-fpm
WORKDIR /var/www/html
COPY --from=0 /old-frontend .

# prepare config
RUN cp inc/config.sample.php inc/config.php

# make variables overwritable
COPY ./entrypoint.sh ./scripts/
RUN chmod +x ./scripts/entrypoint.sh

ENV DOMAIN test.test
ENV MYSQL_ROOT_PASSWORD changeme
ENV SKIP_COMPOSER 1
