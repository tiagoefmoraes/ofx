require "spec_helper"

describe OFX::Parser::BigDecimal do
  describe "#Parse" do
    it "should parse 0.2" do
      described_class.parse(0.2).should == BigDecimal("0.2")
    end

    it "should parse 0.01" do
      described_class.parse(0.01).should == BigDecimal("0.01")
    end

    it "should parse 0,06" do
      described_class.parse("0,06").should == BigDecimal("0.06")
    end

    it "should parse 0.567" do
      described_class.parse(0.567).should == BigDecimal("0.567")
    end

    it "should parse 23" do
      described_class.parse(23).should == BigDecimal("23.0")
    end

    it "should parse 25,00" do
      described_class.parse("25,00").should == BigDecimal("25.0")
    end

    it "should parse -778.01" do
      described_class.parse(-778.01).should == BigDecimal("-778.01")
    end

    it "should parse 1234.22" do
      described_class.parse("1234.22").should == BigDecimal("1234.22")
    end

    it "should parse 3,234.22" do
      described_class.parse("3,234.22").should == BigDecimal("3234.22")
    end

    it "should parse 7894,01" do
      described_class.parse("7894,01").should == BigDecimal("7894.01")
    end

    it "should parse 3.308,20" do
      described_class.parse("3.308,20").should == BigDecimal("3308.20")
    end

    it "should not parse 988.234.22" do
      expect { described_class.parse("988.234.22") }.to raise_error ArgumentError
    end

    it "should parse 'R$ 0.11'" do
      described_class.parse("R$ 0.11").should == BigDecimal("0.11")
    end

    it "should parse '-R$ 0,01'" do
      described_class.parse("-R$ 0,01").should == BigDecimal("-0.01")
    end
  end
end