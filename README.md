# web-app-py

## Setting for development
```sh
# After installed poetry.
$ poetry install --no-root
```

## Start local
It need to start docker processor and defines the environment(IMAGE, TAG, ENV)
and follow this bash command. This repo for practice to devops with kubernetes, helm, argoCD
```bash
$ export IMAGE="web-app-py"\
    TAG="1.0"\
    ENV="local"\
    PORT="3000"
$ export DOCKER_ID={your_docker_id}
$ poetry export --without-hashes --format=requirements.txt > requirements.txt
$ docker build --no-cache --platform linux/x86_64 -t $DOCKER_ID/$IMAGE:$TAG --build-arg ENV=$ENV --build-arg PORT=$PORT .
```

## Use terraform
```sh
$ terraform plan -var-file="config/dev.tfvars" -out=tfplan
```

## helm을 이용하기
```sh
# Install the chart for the develop environment
helm install demo ./demo --namespace my-namespace -f ./demo/develop/values.yaml --set image.tag=v1.0.0 --set service.type=NodePort
```