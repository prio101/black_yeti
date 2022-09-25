# Build Command Docker:

```
 docker build -t rails-toolbox -f Dockerfile.rails .
```

# Runner Command:
```
  docker run -it -v $PWD:/opt/app rails-toolbox rails new --skip-bundle black-yeti-app
```

# build the volumes:

```
  docker volume create --name black-yeti-postgres
```
