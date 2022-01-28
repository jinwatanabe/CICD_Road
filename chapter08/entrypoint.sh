#!/bin/sh
set -e
rm -f /myapp/tmp/pids/server.pid
bundle exec rails db:create RAILS_ENV=production
# bundle exec rails db:migrate RAILS_ENV=production
# bundle exec rails db:seed RAILS_ENV=production
exec "$@"