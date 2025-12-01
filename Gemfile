source "https://rubygems.org"
ruby "3.2.3"

gem "rails", "~> 7.1.6"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 7.1.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows ]  # Updated platform to :windows
gem "bootsnap", require: false

# Admin & Authentication
gem 'activeadmin'
gem 'devise'
# Comment out 'arctic_admin' since it could not be found
# gem 'arctic_admin'

# Image Processing
gem 'image_processing', '~> 1.2'

# Pagination
gem 'kaminari'

# SASS
gem 'sassc-rails'

# Breadcrumbs
gem 'gretel'

# Data
gem 'faker'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]  # Updated platform to avoid mingw deprecation
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
