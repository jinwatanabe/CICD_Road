FROM ruby:alpine3.13

ARG UID

RUN adduser -D app -u ${UID:-1000} && \
      apk update \
      && apk add --no-cache gcc make libc-dev g++ mariadb-dev tzdata nodejs~=14 yarn

ENV RAILS_ENV=production

WORKDIR /myapp
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY --chown=app:app . /myapp
RUN yarn install
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

RUN chmod +x ./bin/webpack
RUN NODE_ENV=production ./bin/webpack

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

VOLUME /myapp/public
VOLUME /myapp/tmp

CMD /bin/sh -c "rm -f tmp/pids/server.pid && bundle exec puma -C config/puma.rb"
