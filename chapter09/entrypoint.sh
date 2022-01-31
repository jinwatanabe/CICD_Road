#!/bin/sh
set -e
rm -f /myapp/tmp/pids/server.pid
# bundle exec rails db:create
# bundle exec rails db:migrate
# bundle exec rails db:seed
exec "$@"