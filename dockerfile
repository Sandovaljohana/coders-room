# Usa una imagen base de PHP con Apache
FROM php:8.2-apache

# Instala las dependencias necesarias
RUN docker-php-ext-install pdo_mysql mysqli

# Configura el entorno de Apache
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copia los archivos de la aplicación al contenedor
COPY . /var/www/html

# Expone el puerto 80
EXPOSE 80

# Instala Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instala las dependencias de la aplicación
RUN composer install

# Inicializa y configura la base de datos, incluyendo la ejecución del seeder
RUN php artisan migrate && php artisan db:seed && php artisan migrate:fresh --seed --force

# Inicia Apache al ejecutar el contenedor
CMD ["apache2-foreground"]
