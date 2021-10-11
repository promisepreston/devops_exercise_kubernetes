FROM ruby:3.0.1

ENV BUNDLER_VERSION=2.2.23

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install bundler
RUN gem install bundler -v 2.2.23

# Set working directory
WORKDIR /app

# Copy Gemfile and bundle install
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

# Copy other project files
COPY . ./

# Docker init
RUN ["chmod", "+x", "docker-entrypoint.sh"]
ENTRYPOINT ["./docker-entrypoint.sh"]
