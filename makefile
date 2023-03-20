IMAGE:=web-app-py
TAG:=1.0
ENV:=local
PORT:=3000

build:
	docker build --no-cache --platform linux/x86_64 -t $(IMAGE):$(TAG) --build-arg ENV=$(ENV) --build-arg PORT=$(PORT) .