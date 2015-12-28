FROM phusion/passenger-ruby22:0.9.18
MAINTAINER Danny Guinther "dannyguinther@gmail.com"

# Set env vars
ENV HOME /root

# Use phusion/baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Expose HTTP service
EXPOSE 80

# Clean up. remove default configs, and start nginx.
RUN apt-get clean && rm -rf \
  /etc/nginx/main.d/* \
  /etc/nginx/sites-enabled/* \
  /etc/service/nginx/down \
  /tmp/* \
  /var/lib/apt/lists/* \
  /var/tmp/*

# Add nginx config
ADD config/nginx/site.conf /etc/nginx/sites-enabled/passenger_rails

# Add passenger environment vars
ADD config/nginx/env.conf /etc/nginx/main.d/env.conf

# On-build hooks
ONBUILD WORKDIR /app

ONBUILD ADD Gemfile /app/
ONBUILD ADD Gemfile.lock /app/
ONBUILD RUN bundle install --deployment --without development test

# Add the Rails app
ONBUILD ADD . /app
ONBUILD RUN chown -R app:app /app
