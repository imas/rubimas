module Rubimas
  class Idol
    attr_reader :idol_id, :key, :idol_type, :name, :age, :height, :weight, :bust, :waist, :hip,
                :birthday, :blood_type, :handedness, :hobbies, :talents, :favorites, :color
    @@config = nil
    @@all_idols = nil

    def initialize(**args)
      @idol_id          = args[:idol_id]
      @key              = args[:key]
      @idol_type        = args[:idol_type]
      @name             = Name.new(args[:name])
      @age              = args[:age]
      @height           = args[:height]
      @weight           = args[:weight]
      @bust             = args[:bust]
      @waist            = args[:waist]
      @hip              = args[:hip]
      @birthday         = args[:birthday]
      @blood_type       = args[:blood_type]
      @handedness       = args[:handedness]
      @hobbies          = args[:hobbies]
      @talents          = args[:talents]
      @favorites        = args[:favorites]
      @color            = args[:color]
    end
    alias_method :id, :idol_id

    class << self
      def config
        unless @@config
          config_file = "#{File.dirname(__FILE__)}/../../config/idols.yml"
          @@config = YAML.load_file(config_file).deep_symbolize_keys
        end
        @@config
      end

      def names
        config.keys
      end

      def all
        @@all_idols ||= config.map { |key, prof| prof[:key] = key; new(prof) }
      end
      alias_method :all_idols, :all

      def find(idol_id)
        all_idols.find { |idol| idol.id == idol_id }
      end
      alias_method :find_by_id, :find

      def find_by_name(idol_name)
        all_idols.find { |idol| [idol.key, idol.name].include?(idol_name) } || raise("unknown idol: #{idol_name}")
      end

      def valid?(idol_name)
        names.include?(idol_name)
      end
    end
  end
end
