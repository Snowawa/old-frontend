FROM composer
WORKDIR /old-frontend
COPY . .

RUN composer install

FROM php
WORKDIR /old-frontend
COPY --from=0 /old-frontend .

RUN docker-php-ext-install pdo pdo_mysql

EXPOSE 9000
ENV DOMAIN test.test

RUN cp inc/config.sample.php inc/config.php
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "php", "index.php" ]
