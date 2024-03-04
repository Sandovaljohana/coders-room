# Usa una imagen base de PHP con Apache
FROM php:8.2-apache

# Instala las dependencias necesarias
RUN docker-php-ext-install pdo_mysql mysqli

# Instala el paquete necesario para ejecutar el comando curl
RUN apt-get update && apt-get install -y curl

# Descarga e instala Nixpacks
RUN curl -sSL https://nixpacks.com/install.sh | bash

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

RUN php artisan migrate:fresh --seed

RUN npm run build

RUN npm run dev

# Copia el script de entrada de Docker
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Define las variables de entorno para la conexión a la base de datos
ENV DB_CONNECTION=mysql
ENV DB_HOST=monorail.proxy.rlwy.net
ENV DB_PORT=30759
ENV DB_DATABASE=railway
ENV DB_USERNAME=root
ENV DB_PASSWORD=HDHADecfCEH2eeEBB3fH1D61-3H6a11h

# Configura el script de entrada como el comando predeterminado al ejecutar el contenedor
ENTRYPOINT ["docker-entrypoint.sh"]

# Inicia Apache al ejecutar el contenedor
CMD ["apache2-foreground"]

