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

# Instala las dependencias de la aplicación
RUN composer install

# Instala las dependencias de Node.js
RUN npm install

# Ejecuta los comandos de optimización y cache para Laravel
RUN php artisan optimize
RUN php artisan config:cache
RUN php artisan route:cache
RUN php artisan view:cache

# Migra la base de datos
RUN php artisan migrate --force

# Si es necesario, genera datos de semilla (seed)
# Si tienes un archivo seeder específico, agrégalo aquí
RUN php artisan db:seed

# Inicia Apache al ejecutar el contenedor
CMD ["apache2-foreground"]
