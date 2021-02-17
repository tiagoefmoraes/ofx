module OFX
  module Parser
    class BigDecimal
      def self.parse(value)
        BigDecimal(value.to_s.tr(',', '.'))  
      rescue ArgumentError
        if (value.index(".") < value.index(","))
          BigDecimal(value.to_s.tr('.', '').tr(',', '.'))      
        else
          BigDecimal(value.to_s.tr(',', ''))      
        end
      end
    end
  end
end