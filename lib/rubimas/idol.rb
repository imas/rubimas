module Rubimas
  # Precure girl (ex. Cure Peace, Cure Rosetta, Cure Honey)
  #
  # this is record of "config/girls.yml"
  class Idol
    attr_reader :idol_id, :name, :name_kana, :age, :height, :weight, :bust, :waist, :hip,
                :birthday, :blood_type, :handedness, :hobby, :talent, :favorite, :color
    @@cache = {}
    @@config = nil
    @@sleep_sec = 1

    def initialize(idol_id: nil, name: nil, name_kana: nil, age: nil, height: nil, weight: nil,
                   bust: nil, waist: nil, hip: nil, birthday: nil, blood_type: nil, handedness: nil,
                   hobby: [], talent: [], favorite: nil, color: nil)
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
      @hobby            = hobby
      @talent           = talent
      @favorite         = favorite
      @color            = color
    end

    # @return [Hash] content of config/girls.yml
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
      raise "unknown girl: #{idol_name}" unless valid?(idol_name)

      unless @@cache[idol_name]
        idol_config = config[idol_name] || {}
        @@cache[idol_name] = Rubimas::Idol.new(idol_config)
      end

      @@cache[idol_name]
    end

    # @param [Symbol] idol_name
    def self.valid?(idol_name)
      names.include?(idol_name)
    end
  end
end
