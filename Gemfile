# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

group :development, :test do
  gem 'rubocop', '~> 1.68', require: false
  gem 'rubocop-performance', '~> 1.22.1', require: false

  gem 'debug', '~> 1.9.2'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
