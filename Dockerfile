FROM composer
WORKDIR /old-frontend
COPY . .

RUN composer install

FROM php
WORKDIR /old-frontend
COPY --from=0 /old-frontend .

RUN docker-php-ext-install pdo pdo_mysql

EXPOSE 9000

CMD [ "php", "index.php" ]
