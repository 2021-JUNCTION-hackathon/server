ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

require 'minitest/unit'
require 'mocha/minitest'

class ActiveSupport::TestCase
  require 'simplecov'
  
  SimpleCov.start
  Apipie.record('examples')
  
  include FactoryBot::Syntax::Methods
end
