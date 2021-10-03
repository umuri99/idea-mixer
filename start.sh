#!/bin/sh

if [ "${RAILS_ENV}" = "production" ]
then
    bundle exec rails assets:precompile
    bundle exec puma -C config/puma.rb
    exit
fi

bundle exec rails s -p ${PORT:-3000} -b 0.0.0.0
