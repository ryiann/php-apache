# Use the official PHP 7.4 image as the base image
FROM php:7.4-apache

# Install required extensions and packages
RUN apt-get update && apt-get install -y \
    libzip-dev \
    && docker-php-ext-install zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Enable mod_rewrite Apache module
RUN a2enmod rewrite

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the application code to the working directory
COPY . .

# Expose port 80
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
