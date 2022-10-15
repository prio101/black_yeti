
# Code name: Black Yeti

---

Application made with Ruby on Rails for quick Demo of the
Black Yeti Service application.


# Frontend:
---
- [Tailwind](https://tailwindcss.com/)
- [HyperUI](https://www.hyperui.dev/)



# Setup:

## Build Command Docker:

```
 docker build -t rails-toolbox -f Dockerfile.rails .
```

## Runner Command:
```
  docker run -it -v $PWD:/opt/app rails-toolbox rails new --skip-bundle black-yeti-app
```

## build the volumes:

```
  docker volume create --name black-yeti-postgres
```

## Run Docker App

```
  docker compose up
```


## run elasticsearch seperately

```
  docker run \
    -p 127.0.0.1:9200:9200 \
    -p 127.0.0.1:9300:9300 \
    -e "discovery.type=single-node" \
    docker.elastic.co/elasticsearch/elasticsearch:7.16.2
```
