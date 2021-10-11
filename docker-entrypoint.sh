#!/bin/sh

set -e

GREEN='\033[0;32m'

echo "${GREEN}Testing application"
bundle exec rails test

echo "${GREEN}Migrating database"
bundle exec rails db:migrate

echo "${GREEN}Seeding database"
bundle exec rails db:seed

echo "${GREEN}Deleting server.pid"
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

echo "${GREEN}Starting rails server"
bundle exec rails server -b 0.0.0.0 -e production
