source 'https://rubygems.org'

gem 'rails', '~> 5.2'
gem 'sass-rails', '~> 5.0'

gem 'mongoid', '6.2.1'
gem 'mongoid_rails_migrations', git: "https://github.com/alphagov/mongoid_rails_migrations", branch: "avoid-calling-bundler-require-in-library-code-v1.1.0-plus-mongoid-v5-fix"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 4.1.20'

gem 'whenever', '~> 1.0.0', require: false
gem 'will_paginate_mongoid', '~> 2.0.1'
gem 'redis', '4.1.2', require: false # Used by the Organisation importer as a locking mechanism
gem 'mlanett-redis-lock', '0.2.7' # Used by the Organisation importer as a locking mechanism
gem 'gretel', '3.0.9'

gem 'govuk_admin_template', '~> 6.7'
gem 'gds-sso', '~> 14.1.1'
gem 'plek'
gem 'gds-api-adapters'
gem "govuk_app_config", "~> 1.20.1"

group :development, :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.8.2'
  gem 'factory_bot_rails', '~> 5'

  gem 'simplecov', '~> 0.17.0', require: false
  gem 'simplecov-rcov', '~> 0.2.3', require: false
  gem 'capybara', '~> 3.27.0'
  gem 'database_cleaner', '~> 1.7.0'
  gem 'webmock', '~> 3.6.0', require: false

  gem 'byebug'
  gem 'pry'
  gem 'govuk-content-schema-test-helpers'
  gem 'govuk-lint'
end
