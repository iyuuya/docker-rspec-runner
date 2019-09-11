FROM ruby:2.6.4

LABEL maintainer "Yuya Ito <i.yuuya@gmail.com>"

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler:$(grep -a1 'BUNDLED WITH' Gemfile.lock | tail -1 | sed 's/\s\+//') --no-document \
 && bundle install -j4 --retry 3

ENV RAILS_ENV test

ENTRYPOINT ["rspec"]
CMD ["spec"]
