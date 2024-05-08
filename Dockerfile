FROM ruby:3.1.4

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
RUN gem install bundler:2.4.13

# Install Node.js and Yarn using NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - 
RUN apt-get install -y nodejs
RUN npm install -g yarn

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3001"]
