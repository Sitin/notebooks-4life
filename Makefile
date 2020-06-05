.PHONY: all lab

DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
DOCKER_DIR := $(realpath $(DIR)/ci/docker)

all: lab

notebook:
	@echo Running Jupyter Notebook && \
	./bin/run.sh notebook

lab:
	@echo Running Jupyter Lab && \
	./bin/run.sh lab

hub:
	@echo Running Jupyterhub && \
	./bin/run.sh hub

clean: docker-down jupyterhub-clean

jupyterhub-clean:
	@echo Cleaning Jupyterhub && \
	rm -rf ./lab && \
	rm -f jupyterhub.sqlite &&\
	rm -f migrated && \
	rm -f jupyterhub_cookie_secret && \
	rm -f passwords.dbm && \
	rm -f .Rhistory

create-dotenv:
	@echo Creating .env for docker-compose && \
	echo Fill ./ci/docker/.env before running other docker-related commands! && \
	cd $(DOCKER_DIR) && \
	if [[ ! -e .env ]]; then cp .env-template .env; fi

docker-build:
	@echo Building Data Science Notebooks with Docker && \
	cd $(DOCKER_DIR) && \
	docker-compose build

docker-rebuild:
	@echo Rebuilding Data Science Notebooks with Docker from scratch && \
	cd $(DOCKER_DIR) && \
	docker-compose build --no-cache

docker-up:
	@echo Running with Data Science Notebooks with Docker && \
	cd $(DOCKER_DIR) && \
	docker-compose up

docker-down:
	@echo Cleaning up Docker && \
	cd $(DOCKER_DIR) && \
	docker-compose down

nvm-setup:
	@echo Setting up Node.js && \
	nvm-init && nvm use 12.16.1
