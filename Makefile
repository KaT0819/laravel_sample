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

check:
	wget http://localhost:8010/index.html

## laravel_web: workspace container bash
bash:
	docker-compose exec php bash
