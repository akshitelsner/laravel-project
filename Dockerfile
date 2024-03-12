FROM php:8.2-apache
WORKDIR /var/www/html
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions mbstring pdo_mysql zip exif pcntl gd
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl
RUN docker-php-ext-install pdo && docker-php-ext-enable pdo
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
COPY vhost.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
RUN service apache2 restart
RUN apt-get update && apt-get upgrade -y
RUN useradd akshit && \
    usermod -a -G www-data akshit
RUN chown -R akshit:www-data /var/www/html
#RUN chmod o+w ./storage/ -R
