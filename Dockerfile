FROM ruby:2.5-slim-buster

# xxx: installing gems seems like a big mess and probably
# makes the Dockerfile larger than it should be.
# do a multi-stage build?

RUN apt-get update && apt-get install -y build-essential libpq-dev

COPY --from=bigfuncloud/helpers:latest /biginit /usr/bin
COPY --from=caddy:2.4.1 /usr/bin/caddy /usr/bin
ADD Caddyfile /etc/caddy/Caddyfile

COPY . /app
WORKDIR /app

RUN gem install bundler -v 2.0.1
RUN bundle config --global frozen 1 \
 && bundle install --without development test -j4 --retry 3 \
 && rm -rf /usr/local/bundle/cache/*.gem \
 && find /usr/local/bundle/gems/ -name "*.c" -delete \
 && find /usr/local/bundle/gems/ -name "*.o" -delete


CMD ["biginit", "caddy", "ruby app.rb"]
