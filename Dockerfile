# Install Postgres and configure a username + password
USER root

ARG POSTGRES_USER=$POSTGRES_USER
ARG POSTGRES_PASSWORD=$POSTGRES_PASSWORD

RUN apt update -y && apt install postgresql postgresql-contrib -y

USER postgres
WORKDIR /db
COPY ./db .

RUN service postgresql start && \
psql -c "CREATE USER $POSTGRES_USER PASSWORD '$POSTGRES_PASSWORD'" && \
psql < 1_create_tables.sql && \
psql < 2_seed_users.sql && \
psql < 3_seed_tokens.sql && \
psql -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO $POSTGRES_USER;" && \
psql -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO $POSTGRES_USER"

# -- End database setup