FROM php:8.2-fpm
RUN apt-get update && apt-get install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu xdebug \
    && docker-php-ext-enable apcu xdebug \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip
COPY ./php/ /usr/local/etc/php/conf.d/
WORKDIR /var/www/html
RUN git config --global url."https://{GITHUB_API_TOKEN}:@github.com/".insteadOf "https://github.com/"
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony