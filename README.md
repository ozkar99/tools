# tools (WIP)

this is kitchen-sink for tools that i use and external applications for, and was never satisfied with them,
so ill just make them myself how i like them, and improve upon them gradually.

making this open source in case anyone, wants to host their own stuff.

check `Dockerfile` for dependencies.

## modules

- password manager
- notes
- todo lists
- rss reader

### credentials.env file for docker-compose
```
RAILS_MASTER_KEY=
POSTGRES_PASSWORD=
```

### setup

#### development

log in to postgres user then run:
```shell
psql -c "CREATE ROLE tools WITH PASSWORD 'tools';" -U postgres
psql -c "ALTER ROLE tools WITH CREATEDB;" -U postgres

rails db:create
rails db:migrate
```

#### docker deploy:
I have in place 2 `docker-compose` files one for building image: `docker-compose.yml` and another that pulls a ref (commit or latest) from docker hub: `docker-compose-registry.yml`, the registry file expects a `REF` environment variable or else it will fail.

##### pulling image from repo (recommended):
- create database `REF=latest docker-compose run migrate rails db:create -f docker-compose-registry.yml`
- run everything with `REF=latest docker-compose up -f docker-compose-registry.yml -d`

##### building image locally:
- create database with `docker-compose run migrate rails db:create`
- run everything with `docker-compose up -d`


### additional info:
code is hosted on <http://tools.ozkar.org> and the docker image is at <https://hub.docker.com/r/ozkar99/tools/>

send me an email or something if you want an account since registrations are currently closed.