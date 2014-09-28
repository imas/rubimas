require 'active_support/all'
require 'yaml'
require 'hashie'
require "rubimas/version"
require "rubimas/idol"
require "rubimas/pro765"

module Rubimas
  def self.core
    Rubimas::Core.instance
  end
end
