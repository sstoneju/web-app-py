IMAGE:=web-app-py
TAG:=1.0
ENV:=local
PORT:=3000

docker.build:
	docker build --no-cache --platform linux/x86_64 -t $(IMAGE):$(TAG) --build-arg ENV=$(ENV) --build-arg PORT=$(PORT) .

terraform.init:
	cd ./terraform && \
	rm -rf .terraform && \
	terraform init

terraform.plan:
	cd ./terraform && \
	terraform plan -var-file=config/dev.tfvars -out=planfile && \
	terraform show -json planfile | jq . >> tfplan.json

terraform.apply:
	cd ./terraform && \
	terraform apply planfile