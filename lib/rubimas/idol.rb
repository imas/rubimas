module Rubimas
  class Idol
    attr_reader :idol_id, :key, :idol_type, :name, :age, :height, :weight, :bust, :waist, :hip,
                :birthday, :blood_type, :handedness, :hobbies, :talents, :favorites, :color
    @@config = nil
    @@all_idols = nil

    def initialize(idol_id: nil, key: nil, idol_type: nil, name: nil, age: nil, height: nil, weight: nil,
                   bust: nil, waist: nil, hip: nil, birthday: nil, blood_type: nil, handedness: nil,
                   hobbies: [], talents: [], favorites: [], color: nil)
      @idol_id          = idol_id
      @key              = key
      @idol_type        = idol_type
      @name             = Name.new(name)
      @age              = age
      @height           = height
      @weight           = weight
      @bust             = bust
      @waist            = waist
      @hip              = hip
      @birthday         = birthday
      @blood_type       = blood_type
      @handedness       = handedness
      @hobbies          = hobbies
      @talents          = talents
      @favorites        = favorites
      @color            = color
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
        all_idols.find { |idol| idol.key == idol_name } || raise("unknown idol: #{idol_name}")
      end

      def valid?(idol_name)
        names.include?(idol_name)
      end
    end
  end
end
