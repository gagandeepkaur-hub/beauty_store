source "https://rubygems.org"
ruby "3.2.3"

# Core Rails Gems
gem "rails", "~> 8.1.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 7.0.4"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[windows]
gem "bootsnap", require: false

# Authentication (ONLY ONE ENTRY)
gem "devise"

# Admin Panel
gem "activeadmin"

# File/Image Processing
gem "image_processing", "~> 1.2"

# Pagination
gem "kaminari"

# SASS
gem "sassc-rails"

# Breadcrumbs
gem "gretel"

# Fake Data
gem "faker"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

