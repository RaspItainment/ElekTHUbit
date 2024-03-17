# aaos-grapeup build

## Build docker image

```bash
docker build -t grapeup-image .
```

## Run docker container

```bash
docker run -d --name grapeup-container --privileged -it grapeup-image
```
