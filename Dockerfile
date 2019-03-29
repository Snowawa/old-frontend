FROM alpine/git
WORKDIR /old-frontend
COPY . .

RUN git submodule update --init --recursive

FROM composer
WORKDIR /old-frontend
COPY --from=0 /old-frontend .

RUN composer install

FROM php
WORKDIR /old-frontend
COPY --from=1 /old-frontend .

RUN docker-php-ext-install pdo pdo_mysql

EXPOSE 9000

CMD [ "php", "index.php" ]
