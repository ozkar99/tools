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

### development

log in to postgres user then run:
```shell
psql -c "CREATE ROLE tools WITH PASSWORD 'tools';" -U postgres
psql -c "ALTER ROLE tools WITH CREATEDB;" -U postgres

rails db:create
rails db:migrate
```
### deployment
its using docker-compose for deployment, just run the following commands for deploy:

- create database `docker-compose run migrate rails db:create` (only the first time)
- run everything with `docker-compose up -d`

#### deployment notes:
- keep in mind that Caddyfile is pointing to tools.ozkar.org so you might want to change that.
- you can pass env variable `REF` to docker deploy for a specific image tag.

### additional info:
code is hosted on <https://tools.ozkar.org> and the docker image is at <https://hub.docker.com/r/ozkar99/tools/>

send me an email or something if you want an account since registrations are currently closed.
