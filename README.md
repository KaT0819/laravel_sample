# laravel_sample

## docker build
docker-compose up -d

## container base
docker-compose exec php bash

## create laravel project
composer create-project laravel/laravel sample "5.7"


http://127.0.0.1/


## Controller作成
php artisan make:controller Admin/NewsController



## laravel cache clear
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear