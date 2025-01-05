# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

group :development, :test do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false

  gem 'debug'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
