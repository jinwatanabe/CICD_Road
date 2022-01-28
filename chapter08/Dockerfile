FROM ruby:alpine3.13 as Base

ARG UID

RUN adduser -D app -u ${UID:-1000} && \
      apk update \
      && apk add --no-cache gcc make libc-dev g++ mariadb-dev tzdata nodejs~=14 yarn

WORKDIR /myapp
COPY Gemfile .
COPY Gemfile.lock .
COPY package.json .
COPY yarn.lock .

RUN bundle install --jobs=4

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Development
FROM base as development

RUN yarn install
COPY --chown=app:app . /myapp

USER app
RUN mkdir -p tmp/sockets tmp/pids

EXPOSE 3000
CMD ["sh", "-c", "./bin/webpack && bundle exec rails s -p 3000 -b '0.0.0.0'"]

# build
FROM base as build

RUN mkdir -p tmp/sockets tmp/pids
COPY --chown=app:app . /myapp
RUN yarn install

# compile
FROM build as compile

ENV NODE_ENV=production
RUN ./bin/webpack

# production
FROM compile as production

ENV RAILS_ENV=production
VOLUME /myapp/public
VOLUME /myapp/tmp

CMD /bin/sh -c "bundle exec puma -C config/puma.rb"