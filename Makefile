.PHONY: build-release
build-release:
	sudo docker build -t $(IMAGE_NAME) --target release --network host .

.PHONY: build-debug
build-debug:
	sudo docker build -t $(IMAGE_NAME) --target debug .

.PHONY: up
up:
	sudo docker compose up -d

.PHONY: down
down:
	sudo docker compose down

.PHONY: console
console:
	sudo docker compose exec focalboard /bin/bash