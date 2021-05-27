#!/bin/sh

sed -i 's@REDMINE_DB_DATABASE@'"$REDMINE_DB_DATABASE"'@' config/database.yml
sed -i 's@REDMINE_DB_USERNAME@'"$REDMINE_DB_USERNAME"'@' config/database.yml
sed -i 's@REDMINE_DB_PASSWORD@'"$REDMINE_DB_PASSWORD"'@' config/database.yml
sed -i 's@MYSQL_HOST@'"$MYSQL_HOST"'@' config/database.yml

bundle install --without development test postresql sqlite
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production REDMINE_LANG=en bundle exec rake redmine:load_default_data
bundle exec rails server  webrick -e production


