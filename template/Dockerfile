FROM ruby:2.6.4

LABEL maintainer "Yuya Ito <i.yuuya@gmail.com>"
LABEL for "template"

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# RUN apt-get update \
#  && apt-get install -y \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler:$(grep -a1 'BUNDLED WITH' Gemfile.lock | tail -1 | sed 's/\s\+//') --no-document \
 && bundle install -j4 --retry 3

ENTRYPOINT ["rspec"]
CMD ["spec"]
