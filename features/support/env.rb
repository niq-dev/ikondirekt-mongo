require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= "cucumber"
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

  require 'cucumber'
  require 'cucumber/rails'
  require 'cucumber/formatter/unicode' # Comment out this line if you don't want Cucumber Unicode support
  require 'rspec/rails'
  require 'cucumber/rails/rspec'


  Capybara.default_selector = :css
end

Spork.each_run do

  ActionController::Base.allow_rescue = false
  Cucumber::Rails::World.use_transactional_fixtures = true

  begin
    DatabaseCleaner.strategy = :truncation, {:except => %w[users asn_slash_codes asn_order_statuses cdf_binding_codes po_statuses po_types poa_statuses poa_types products variants line_items orders]}
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator.rb")) do |f|
    Rails.configuration.cache_classes ? require(f) : load(f)
  end

end