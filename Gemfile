source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.4"

gem "bootsnap", ">= 1.4.2", require: false
gem "jbuilder", "~> 2.7"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "rails", "~> 6.0.0"
gem "redis", "~> 4.0"
gem "sass-rails", "~> 5"
gem "sidekiq", "~> 6.0"
gem "stimulus_reflex", "~> 2.1"
gem "webpacker", "~> 4.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-nav"
  gem "pry-rails"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "spring"
  gem "standard"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "active_link_to", "~> 1.0"
