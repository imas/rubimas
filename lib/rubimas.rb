require 'active_support/all'
require 'yaml'
require 'hashie'
require "rubimas/version"
require "rubimas/idol"
require "rubimas/idol/name"
require "rubimas/core_ext/fixnum"

module Rubimas
  def self.method_missing(name, *args)
    if Rubimas::Idol.valid?(name)
      Rubimas::Idol.find_by_name(name)
    else
      super
    end
  end
end
