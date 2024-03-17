# aaos-grapeup build

## Build docker image

```bash
docker build -t rv-image .
```

## Run docker container

```bash
docker run -d --name rv-container --privileged -it rv-image
```