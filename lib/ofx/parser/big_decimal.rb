module OFX
  module Parser
    class BigDecimal
      def self.parse(value)
        value = value.to_s.gsub("R$ ", "")
        BigDecimal(value.tr(',', '.'))
      rescue ArgumentError
        if (value.index(".") < value.index(","))
          BigDecimal(value.tr('.', '').tr(',', '.'))
        else
          BigDecimal(value.tr(',', ''))
        end
      end
    end
  end
end