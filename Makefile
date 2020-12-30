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

serve:
	php ./server/sample/artisan serve

check:
	wget http://localhost:8000/index.html

## laravel_web: workspace container bash
bash:
	docker-compose exec tech-boost-php bash

## mysql: workspace container bash
db-bash:
	docker-compose exec tech-boost-db bash

