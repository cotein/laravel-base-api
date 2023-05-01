#!/bin/bash

if [ ! -f "vendor/autoload.php" ]; then
    composer install --no-progress --no-interaction
fi

echo "Ejecutando comandos artisan"

php artisan migrate
php artisan key:generate

echo "Finalizado comandos artisan"


exec docker-php-entrypoint "$@"
