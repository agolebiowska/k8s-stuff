# Simple deployment with kubectl, docker & minikube

## Commands

Builds the local image, then uses that image to create a deployment which is exposed as service

```shell
$ make create 
```

Creates a time stamped version of the image and update the deployment to use this new image
```shell
$ make update 
```

Deletes deployment & service
```shell
$ make delete 
```

Builds new image and pushes it to docker.io
```shell
$ make push
```

Opens service in default browser
```shell
$ make open
```

Lists pods, services & deployments
```shell
$ make list
```
