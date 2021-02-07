source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', :require => false
gem 'tzinfo-data', :platforms => [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'carrierwave'
gem 'kaminari'
gem 'bullet', :group => :development
gem 'parser', '>= 2.7.1.5'
gem 'whenever', require: false
gem 'active_decorator'
gem 'pry-rails'
gem 'jquery-rails'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', :require => false
  gem 'rubocop-performance', :require => false
  gem 'rubocop-rails', :require => false
  gem 'rubocop-rspec'
  gem "better_errors"
  gem "binding_of_caller"
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'webmock'
end

group :production do
  gem 'pg', '>= 0.18', '< 2.0'
end

group :development, :test do
  gem 'byebug', :platforms => [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.6'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails', '~> 4.11'
  gem 'guard-rspec'
  gem 'vcr'
end
