source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  gem 'guard', '2.16.2'
  gem 'guard-minitest', '2.4.6'
  gem 'factory_bot_rails', '6.1.0'
  gem 'simplecov', '0.20.0'
  gem 'mocha', '1.11.2'
  gem 'minitest-spec-rails', '6.0.4'
  gem "faker", '2.15.1'
end

## API 명세서 
gem 'apipie-rails', '0.5.18'

## PostgreSQL DB
gem 'pg', '1.2.3'

## 환경변수
gem 'figaro', '1.2.0'

## capistrano
gem 'capistrano', '3.14.1'
gem 'capistrano-bundler', '2.0.1'
gem 'capistrano-passenger', '0.2.0'
gem 'capistrano-rails', '1.6.1'
gem 'capistrano-rbenv', '2.2.0'
gem 'capistrano-rails-collection', '0.1.0'
gem 'capistrano-figaro-yml', '1.0.5'
gem 'capistrano-database-yml', '1.0.1'

# serializers
gem 'active_model_serializers', '0.10.12'

# devise
gem "devise", '4.7.2'

# Pagination
gem 'kaminari', '1.2.1'

## HTTP 통신
gem "rest-client", '2.1.0'
