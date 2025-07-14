FROM php:8.1-apache
# Install pdo_mysql
RUN apt-get update && apt-get install -y \
    libpq-dev \
    default-mysql-client \
    libicu-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libwebp-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo_mysql \
    && a2enmod rewrite # Enable Apache mod_rewrite module


# Clean up to reduce image size
RUN rm -rf /var/lib/apt/lists/*
