SHELL = /bin/bash

.PHONY: all, build, pack

build:
	docker-compose build

pack: build
	./bin/save-images.sh