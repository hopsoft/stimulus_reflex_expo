# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "bootsnap", ">= 1.4", require: false
gem "cable_ready", "4.4.1"
gem "chartkick", "~> 3.4.0"
gem "countries", "~> 3.0"
gem "faker", "~> 2.7"
gem "hiredis", "~> 0.6.3"
gem "http", "~> 4.1"
gem "jbuilder", "~> 2.7"
gem "pagy", "~> 3.7"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 5.0"
gem "rails", "~> 6.0"
gem "redis", ">= 4.0", require: ["redis", "redis/connection/hiredis"]
gem "rouge", "~> 3.25"
gem "sass-rails", "~> 6"
gem "sidekiq", "~> 6.0"
gem "stimulus_reflex", "3.4.0.pre6"
gem "valid_email", "~> 0.1"
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "awesome_print"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv"
  gem "pry-nav"
  gem "pry-rails"
end

group :development do
  # gem "spring"
  # gem "spring-watcher-listen", "~> 2.0.0"
  gem "annotate"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "magic_frozen_string_literal"
  gem "model_probe"
  gem "standard"
  gem "tmuxinator"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
