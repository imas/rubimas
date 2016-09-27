module Rubimas
  class Idol
    attr_reader :idol_id, :idol_type, :name, :age, :height, :weight, :bust, :waist, :hip,
                :birthday, :blood_type, :handedness, :hobbies, :talents, :favorites, :color
    @@cache = {}
    @@id_cache = {}
    @@config = nil

    def initialize(idol_id: nil, idol_type: nil, name: nil, age: nil, height: nil, weight: nil,
                   bust: nil, waist: nil, hip: nil, birthday: nil, blood_type: nil, handedness: nil,
                   hobbies: [], talents: [], favorites: [], color: nil)
      @idol_id          = idol_id
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

      def find(idol_id)
        unless @@id_cache[idol_id]
          idol_config = config.select { |k, v| v[:idol_id] == idol_id }.values.first
          @@id_cache[idol_id] = Rubimas::Idol.new(idol_config)
        end

        @@id_cache[idol_id]
      end
      alias_method :find_by_id, :find

      def find_by_name(idol_name)
        raise "unknown idol: #{idol_name}" unless valid?(idol_name)

        unless @@cache[idol_name]
          idol_config = config[idol_name] || {}
          @@cache[idol_name] = Rubimas::Idol.new(idol_config)
        end

        @@cache[idol_name]
      end

      def valid?(idol_name)
        names.include?(idol_name)
      end
    end
  end
end
