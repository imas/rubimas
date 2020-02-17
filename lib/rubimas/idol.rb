module Rubimas
  class Idol
    attr_reader :idol_id, :key, :idol_type, :idol_image, :name, :age, :height, :weight, :bust, :waist, :hip,
                :birthday, :blood_type, :handedness, :hobbies, :talents, :favorites, :color, :cv
    @@config = nil
    @@all_idols = nil
    @@theaterdays = false

    def initialize(**args)
      @idol_id          = args[:idol_id]
      @key              = args[:key]
      @idol_type        = args[:idol_type]
      @idol_image       = args[:idol_image]
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
      @cv               = args[:cv]
    end
    alias_method :id, :idol_id

    class << self
      def config(force: false)
        unless @@config && !force
          regexp = @@theaterdays ? '*' : '{[0-4][0-9],50}*'
          @@config = Dir.glob("#{File.dirname(__FILE__)}/../../config/idols/#{regexp}.yml").each_with_object({}) do |file, idols|
            idols.merge!(YAML.load_file(file))
          end.deep_symbolize_keys
          @@all_idols = nil
        end
        @@config
      end

      def theaterdays!
        @@theaterdays = true
        config(force: true)
        true
      end

      def names
        config.keys
      end

      def all
        @@all_idols ||= config.map { |key, prof| prof[:key] = key; new(**prof) }.sort_by { |idol| idol.id }
      end
      alias_method :all_idols, :all

      def find(idol_id)
        all_idols.find { |idol| idol.id == idol_id }
      end
      alias_method :find_by_id, :find

      def find_by_name(idol_name)
        all_idols.find { |idol| [idol.key, idol.name].include?(idol_name) } || (raise UnknownIdolError, "unknown idol: #{idol_name}")
      end

      def valid?(idol_name)
        names.include?(idol_name)
      end
    end

    class UnknownIdolError < StandardError; end
  end
end
