source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


#mongoid & mongoid dependencies
gem 'mongoid', "3.0.6"
#gem 'mongoid_geospatial'
gem 'bson_ext'

#model struct
gem 'mongoid_nested_set'

#workflow
gem 'state_machine'
gem 'ruby-graphviz', :require => 'graphviz' # Optional: only required for graphing

#location dependencies
gem 'geocoder'
gem 'gmaps4rails'

#Authentication
gem 'devise'

#Authorization
gem 'cancan'
gem "rolify"

#controller pattern
gem 'cells'
gem 'apotomo'
gem 'wicked'

#views pattern
gem 'client_side_validations'
gem "slim"
gem 'simple_form'
gem 'kaminari'
gem "simple-navigation"
gem "crummy"
gem 'data_table'

#uploader
gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mini_magick'

gem 'lazy_high_charts'

gem 'rails_admin'
#gem "rails_admin_histeroid"

gem "erb2haml"
gem "haml2slim"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'
  gem 'compass-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
end

group :test do
  gem 'accept_values_for'
  gem 'rspec-rails'
  gem 'simplecov', :require => false
  gem 'capybara'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'guard-spork'
  gem 'spork'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'launchy'
end

gem 'thin'