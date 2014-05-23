source 'https://rubygems.org'

gem 'rails', '3.2.17'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Database
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Uploader and inage manipulation
gem 'carrierwave', '0.9.0'
gem 'rmagick'

# Cloud storage for uploaded items
# gem 'fog', '~> 1.3.1'

# Authentication
gem 'bcrypt-ruby', '~> 3.0.0'

gem 'ransack'

gem 'will_paginate', '~> 3.0'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'hirb'
  gem 'meta_request'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'sextant'
end

group :production do
  gem 'rails_12factor'
end