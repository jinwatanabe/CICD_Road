FROM ruby:alpine3.13

ARG UID

RUN adduser -D app -u ${UID:-1000} && \
      apk update \
      && apk add --no-cache gcc make libc-dev g++ mariadb-dev tzdata nodejs~=14 yarn

WORKDIR /myapp
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY --chown=app:app . /myapp
RUN yarn install
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000
# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

USER app
RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids