#!/bin/sh

if [ -z "$HOST" ] || [ -z "$PORT" ] || [ -z "$USER" ]; then
  echo "HOST, PORT, and USER must be set"
  exit 1
fi

if [ -n "$PASSWORD" ]; then
  export MYSQLD_EXPORTER_PASSWORD="$PASSWORD"
  echo "Starting mysqld_exporter with password"
  exec /bin/mysqld_exporter --mysqld.address="$HOST:$PORT" --mysqld.username="$USER" --log.level=debug
else
  echo "Starting mysqld_exporter without password"
  exec /bin/mysqld_exporter --mysqld.address="$HOST:$PORT" --mysqld.username="$USER" --log.level=debug
fi