FROM debian:stretch

WORKDIR /opt

# Required packages
RUN apt-get update && apt-get -y install \
  postgresql postgresql-contrib postgresql-client libpq-dev

RUN echo "host DB_NAME DB_USERNAME 0.0.0.0/0 trust" >> /etc/postgresql/9.6/main/pg_hba.conf

# Install PostgreSQL
USER postgres
RUN sh /etc/init.d/postgresql start && \
    psql -c "create user DB_USERNAME;" && \
    psql -c "alter user DB_USERNAME with encrypted password 'DB_PASSWD'" && \
    psql -c "alter user DB_USERNAME CREATEDB;" && \
    psql -c "create database DB_NAME;"

CMD exec /usr/lib/postgresql/9.6/bin/postgres \
    -D /var/lib/postgresql/9.6/main \
    -c "config_file=/etc/postgresql/9.6/main/postgresql.conf" \
    -c "listen_addresses=*"
