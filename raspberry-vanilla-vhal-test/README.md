# raspberry-vanilla build

## Build docker image

```bash
docker build -t rv-vhal-image .
```

## Run docker container

```bash
docker run -d --name rv-vhal-container --privileged -it rv-vhal-image
```
