SHELL := /bin/bash
VERSION ?= latest

# The directory of this file
DIR := $(shell echo $(shell cd "$(shell  dirname "${BASH_SOURCE[0]}" )" && pwd ))

IMAGE_NAME ?= ps1337/monit-docker
CONTAINER_NAME ?= monit

# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# DOCKER TASKS
# Build the container
build: ## Build the container
	docker build --rm -t $(IMAGE_NAME) .

build-nc: ## Build the container without caching
	docker build --rm --no-cache -t $(IMAGE_NAME) .

run: ## Run container
	sudo docker run \
	-d \
	--name=monit \
	--restart=always \
	-v $(DIR)/monitrc:/etc/monit/monitrc \
	--expose 2812 \
	-p 127.0.0.1:2812:2812 \
	ps1337/monit-docker:latest

stop: ## Stop a running container
	docker stop $(CONTAINER_NAME)

remove: ## Remove a (running) container
	docker rm -f $(CONTAINER_NAME)

remove-image-force: ## Remove the latest image (forced)
	docker rmi -f $(IMAGE_NAME):$(VERSION)

