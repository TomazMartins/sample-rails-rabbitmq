source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.4', '>= 5.2.4.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'jsonapi-serializer'
gem 'httparty'
gem 'bunny'


group :development, :test do
  gem 'dotenv-rails', require: 'dotenv/rails-now'
  gem 'factory_bot_rails', '~> 4.8'
  gem 'pry-byebug'
  gem 'cpf_cnpj'
  gem 'faker'
end

group :development do
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'listen', '~> 3.2'
  gem 'pry-rails'
  gem 'spring'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'simplecov', require: false
  gem 'webmock'
  gem 'vcr'

  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.8'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
