# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'rack'

# Front-end
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'bootstrap', '~> 4.4.1'
gem 'autoprefixer-rails'
gem 'simple_form'
gem 'uglifier' # we are using uglifier for our embedd JS, so this needs to be outside of :assets group
gem 'mini_racer'
gem 'webpacker', '~> 4.x'

# DB
gem 'pg'

gem 'shrine', '~> 3.0'
gem 'bootsnap', require: false

# Mailers
gem 'mailcatcher'

gem 'sass-rails', '~> 5.0', group: :assets

group :development do
  gem 'rubocop'
  gem 'puma'
  gem 'listen'
end

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'database_cleaner-active_record'
end