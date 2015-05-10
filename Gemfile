source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  	gem 'spring'

  	gem 'rspec-rails'
	gem 'rspec-its'
	gem 'simplecov', :require => false
	gem 'guard-rspec'
	gem 'spork-rails'
	gem 'guard-spork'
end

group :test do
	gem 'selenium-webdriver', '~> 2.42.0'
	gem 'capybara', '~> 2.3.0'
	gem 'factory_girl_rails'
	gem 'faker'
	gem 'launchy'
end

gem 'sqlite3'
gem 'bootstrap-sass', '3.2.0.0'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :production do
	gem 'pg'
	gem 'rails_12factor', '~> 0.0.2'
end
