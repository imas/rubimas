module Rubimas
  class Idol
    class Name
      attr_reader :aka, :family, :family_kana, :given, :given_kana, :shorten

      def initialize(name_object)
        name_object.each do |k, v|
          instance_variable_set("@#{k}", v)
        end
      end

      def to_s
        return @aka if @aka
        full
      end

      def full
        if @family && @given
          "#{@family}#{@given}"
        else
          @aka
        end
      end

      def full_kana
        if @family_kana && @given_kana
          "#{@family_kana}#{@given_kana}"
        else
          self.full
        end
      end

    end
  end
end
