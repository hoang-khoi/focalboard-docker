include .env
IMAGE_NAME := focalboard
REPLACEMENT_TEMPLATE := $(foreach var,$(VAR_LIST),s~__$(var)__~$($(var))~g;)

.PHONY: build-release
build-release: apply_template
	sudo docker build -t $(IMAGE_NAME) --target release .

.PHONY: build-debug
build-debug: apply_template
	sudo docker build -t $(IMAGE_NAME) --target debug .

.PHONY: apply_template
apply_template:
	find $(TEMPLATED_FILES) -type f -exec sed -i "$(REPLACEMENT_TEMPLATE)" {} +

.PHONY: up
up:
	sudo docker compose up -d

.PHONY: down
down:
	sudo docker compose down

.PHONY: console
console:
	sudo docker compose exec focalboard /bin/bash