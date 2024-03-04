# Use a imagem oficial do PHP
FROM php:8.2-cli

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /var/www/html

# Instale as dependências do sistema necessárias
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Instale o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copie o código do seu aplicativo para o contêiner
COPY . .

# Instale as dependências do Composer
RUN composer install --no-scripts --no-autoloader

# Execute tarefas de pré-compilação
RUN composer dump-autoload --optimize
RUN php artisan optimize
RUN php artisan config:cache
RUN php artisan route:cache
RUN php artisan view:cache

# Exponha a porta 8000 para acessar o servidor embutido do PHP
EXPOSE 8000

# Defina o comando padrão para iniciar o servidor embutido do PHP
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
