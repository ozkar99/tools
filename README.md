# tools

this is kitchen-sink for tools and apps

making this open source in case anyone, wants to host their own stuff.

check `Dockerfile` for dependencies.

## modules

- password manager
- note taking (markdown)
- todo lists

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
psql -c "ALTER ROLE tools WITH LOGIN;" -U postgres

rails db:create
rails db:migrate
```
### deployment
we are using docker-compose for quick deployment, just run the following commands for deploy:

- create database: `docker-compose run migrate rails db:create` (only the first time)
- then run the stack with: `docker-compose up -d`

#### deployment notes:
- keep in mind that Caddyfile is pointing to tools.ozkar.org so you might want to change that.
- you also need to recreate the rails master key and create a new credentials.yml.enc file.
- you can pass env variable `REF` to docker deploy for a specific image tag (if not specified it will use latest).

### additional info:
application is hosted on <https://tools.ozkar.org> and the docker image is at <https://hub.docker.com/r/ozkar99/tools/>

send me an email or something if you want an account since registrations are currently closed.
