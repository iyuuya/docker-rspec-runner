FROM ruby:2.6.4

LABEL repository "https://github.com/iyuuya/rspec-runner"
LABEL homepage "https://github.com/iyuuya/rspec-runner"
LABEL maintainer "Yuya Ito <i.yuuya@gmail.com>"
LABEL for "tamago"

RUN mkdir /tmp

COPY Gemfile /tmp/Gemfile
COPY Gemfile.lock /tmp/Gemfile.lock

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
 && apt-get update \
 && apt-get install -y \
    cmake \
    libgit2-dev \
    nodejs \
    yarn \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN gem install bundler:$(grep -a1 'BUNDLED WITH' Gemfile.lock | tail -1 | sed 's/\s\+//') --no-document \
 && cd /tmp && bundle install -j4 --retry 3 && rm /tmp/*

ENV RAILS_ENV test

#ENTRYPOINT ["rspec"]
#CMD ["spec"]
