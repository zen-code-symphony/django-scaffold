#!/bin/sh
# Entrypoint shell script used by a container to check if PostgreSQL
# is up and running.

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# Run database migrations in case of dev environment.
python manage.py migrate

exec "$@"