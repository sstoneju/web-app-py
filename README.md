# web-app-py

## Start local
It need to start docker processor and defines the environment(IMAGE, TAG, ENV)
and follow this bash command. This repo for practice to devops with kubernetes, helm, argoCD
```bash
$ export IMAGE="web-app-py"
$ export TAG="1.0"
$ export ENV="local"
$ export PORT="3000"
$ docker build --no-cache --platform linux/x86_64 -t $IMAGE:$TAG --build-arg ENV=$ENV --build-arg PORT=$PORT .
```