source 'https://rubygems.org'

gem 'rails', '~> 5.1'
gem 'sass-rails', '~> 5.0'

gem 'mongoid', '6.2.1'
gem 'mongoid_rails_migrations', git: "https://github.com/alphagov/mongoid_rails_migrations", branch: "avoid-calling-bundler-require-in-library-code-v1.1.0-plus-mongoid-v5-fix"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 4.1.3'

gem 'unicorn', '~> 5.4.0'
gem 'logstasher', '~> 1.2.2'
gem 'whenever', '~> 0.10.0', require: false
gem 'will_paginate_mongoid', '~> 2.0.1'
gem 'redis', '4.0.1', require: false # Used by the Organisation importer as a locking mechanism
gem 'mlanett-redis-lock', '0.2.7' # Used by the Organisation importer as a locking mechanism
gem 'gretel', '3.0.9'

gem 'govuk_admin_template', '~> 6.4'
gem 'gds-sso', '~> 13.5.0'
gem 'plek'
gem 'gds-api-adapters'
gem "govuk_app_config", "~> 0.2.0"

group :development, :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.7.2'
  gem 'factory_girl_rails', '~> 4.9.0'

  gem 'simplecov', '~> 0.15.1', require: false
  gem 'simplecov-rcov', '~> 0.2.3', require: false
  gem 'capybara', '~> 2.17.0'
  gem 'database_cleaner', '~> 1.6.2'
  gem 'webmock', '~> 3.1.1', require: false

  gem 'byebug'
  gem 'pry'
  gem 'govuk-content-schema-test-helpers'
  gem 'govuk-lint'
end
