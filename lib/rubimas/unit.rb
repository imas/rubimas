module Rubimas
  class Unit
    attr_reader :name, :members, :leader

    def initialize(name, members, leader: nil)
      @name = name
      @members = members
      @leader = leader
    end

    def self.all
      Dir.glob("#{File.dirname(__FILE__)}/../../config/units/**/*.yml").map do |unit_file|
        unit_config = YAML.load_file(unit_file)
        self.new(unit_config['name'], unit_config['members'].map { |id| Rubimas::Idol.find(id) }, leader: Rubimas::Idol.find(unit_config['leader_id']))
      end
    end
  end
end
