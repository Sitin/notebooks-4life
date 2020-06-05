.PHONY: all

DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
ROOT := $(shell dirname $(DIR))
DOCKER_REGISTRY ?= 614482876163.dkr.ecr.eu-central-1.amazonaws.com
IMAGE ?= universum/dsnb/web
DOCKER_TAG ?= local

ci: clean build tag clean

clean:
	@echo Cleaning up docker && \
	docker rmi -f $(IMAGE):ci-local && \
	docker rmi -f $(DOCKER_REGISTRY)/$(IMAGE):$(DOCKER_TAG) && \
	docker rmi -f $(DOCKER_REGISTRY)/$(IMAGE):latest

docker-login:
	@`aws ecr get-login --no-include-email`

build:
	docker build --build-arg AWS_ACCESS_KEY_ID=${bamboo_tf_aws_access_key_id} --build-arg AWS_SECRET_ACCESS_KEY=${bamboo_tf_aws_secret_access_key} --build-arg AWS_REGION=${bamboo_AWS_REGION} --build-arg AWS_SSM_ROOT_PATH=${bamboo_AWS_SSM_ROOT_PATH} --file $(DIR)/docker/Dockerfile --tag $(IMAGE):ci-local $(ROOT)

tag:
	docker tag $(IMAGE):ci-local $(DOCKER_REGISTRY)/$(IMAGE):$(DOCKER_TAG) && \
	docker tag $(IMAGE):ci-local $(DOCKER_REGISTRY)/$(IMAGE):latest

push: docker-login
	docker push $(DOCKER_REGISTRY)/$(IMAGE):$(DOCKER_TAG) && \
	docker push $(DOCKER_REGISTRY)/$(IMAGE):latest
