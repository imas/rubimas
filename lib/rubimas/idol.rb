module Rubimas
  class Idol
    attr_reader :idol_id, :name, :name_kana, :age, :height, :weight, :bust, :waist, :hip,
                :birthday, :blood_type, :handedness, :hobbies, :talents, :favorites, :color
    @@cache = {}
    @@id_cache = {}
    @@config = nil

    def initialize(idol_id: nil, name: nil, name_kana: nil, age: nil, height: nil, weight: nil,
                   bust: nil, waist: nil, hip: nil, birthday: nil, blood_type: nil, handedness: nil,
                   hobbies: [], talents: [], favorites: [], color: nil)
      @idol_id          = idol_id
      @name             = name
      @name_kana        = name_kana
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

    # @return [Hash] content of config/idols.yml
    def self.config
      unless @@config
        config_file = "#{File.dirname(__FILE__)}/../../config/idols.yml"
        @@config = YAML.load_file(config_file).deep_symbolize_keys
      end
      @@config
    end

    # @return [Array<Symbol>]
    def self.names
      config.keys
    end

    # @param idol_name [Symbol]
    # @return [Rubimas::Idol]
    def self.find(idol_name)
      raise "unknown idol: #{idol_name}" unless valid?(idol_name)

      unless @@cache[idol_name]
        idol_config = config[idol_name] || {}
        @@cache[idol_name] = Rubimas::Idol.new(idol_config)
      end

      @@cache[idol_name]
    end

    # @param idol_id [Fixnum]
    # @return [Rubimas::Idol]
    def self.find_by_id(idol_id)
      unless @@id_cache[idol_id]
        idol_config = config.select { |k, v| v[:idol_id] == idol_id }.values.first
        @@id_cache[idol_id] = Rubimas::Idol.new(idol_config)
      end

      @@id_cache[idol_id]
    end

    # @param [Symbol] idol_name
    def self.valid?(idol_name)
      names.include?(idol_name)
    end
  end
end
