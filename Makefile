NAME ?= mysql-client
MYSQL_DOCKER_TAG ?= latest

all: build start

.PHONY: build start
build:
	docker build \
		--tag="opensips/$(NAME):$(MYSQL_DOCKER_TAG)" \
		.

start:
	docker run -d --name $(NAME) opensips/$(NAME):$(OPENSIPS_DOCKER_TAG)
