YAML		=	docker-compose.yml
SRCS		=	./srcs/

CONTS		=	nginx #wordpress mariadb

COMPOSE		= 	sudo docker compose

all		:	up

up		:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) up -d --build)

down	:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) down)

start	:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) start)

stop	:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) stop)

ps		:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) ps)

rm		:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) rm $(CONTS))

config	:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) config)

re		:	stop rm all

.PHONY	:	all up down start stop ps rm config