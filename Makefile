clone:

## docker 
up:
	: # docker-compose up -d --build
	docker-compose up -d

build:
	docker-compose up -d --build

kill:
	docker-compose kill

reload: kill up

## docker-clean: docker remove all containers in stack
clean:
	docker-compose rm -fv --all
	docker-compose down --rmi local --remove-orphans

net:
	docker network create tech-boost-php-network


setup:
	docker-compose exec tech-boost-php bash
	app cp .env.example .env

migrate:
	docker-compose exec tech-boost-php php artisan migrate

cache-clear:
	docker-compose exec tech-boost-php php artisan config:clear
	docker-compose exec tech-boost-php php artisan cache:clear
	docker-compose exec tech-boost-php php artisan route:clear
	docker-compose exec tech-boost-php php artisan view:clear
	docker-compose exec tech-boost-php php artisan config:cache

serv:
	php ./server/sample/artisan serv

check:
	wget http://localhost:8000/index.html

## laravel_web: workspace container bash
bash:
	docker-compose exec tech-boost-php bash

## mysql: workspace container bash
db-bash:
	docker-compose exec tech-boost-db bash

heroku-deploy:
	: # サブディレクトリをプッシュ
	git subtree push --prefix server/sample/ heroku master
