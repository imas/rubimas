$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rubimas'
require 'rspec'
require 'rspec-parameterized'
require 'rspec/its'

RSpec.configure do |config|
  config.order = 'random'
end
