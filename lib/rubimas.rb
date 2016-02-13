require 'active_support/all'
require 'yaml'
require 'hashie'
require "rubimas/version"
require "rubimas/idol"
require "rubimas/idol/name"
require "rubimas/core_ext/fixnum"

module Rubimas
end

module Pro765
  def self.method_missing(name, *args)
    if Rubimas::Idol.valid?(name)
      Rubimas::Idol.find(name)
    else
      super
    end
  end

  def self.find_by_id(idol_id)
    Rubimas::Idol.find_by_id(idol_id)
  end
end
