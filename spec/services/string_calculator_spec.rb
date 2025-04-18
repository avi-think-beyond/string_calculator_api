require 'rails_helper'

RSpec.describe StringCalculator do
  describe ".calculate" do
    it "returns 0 for empty string" do
      expect(StringCalculator.calculate("")).to eq(0)
    end

    it "returns single number as integer" do
      expect(StringCalculator.calculate("1")).to eq(1)
    end

    it "adds two numbers" do
      expect(StringCalculator.calculate("1,2")).to eq(3)
    end

    it "adds multiple numbers" do
      expect(StringCalculator.calculate("1,2,3")).to eq(6)
    end

    it "supports newlines as delimiters" do
      expect(StringCalculator.calculate("1\n2,3")).to eq(6)
    end

    it "supports custom delimiters" do
      expect(StringCalculator.calculate("//;\n1;2")).to eq(3)
    end

    it "raises for negative numbers" do
      expect { StringCalculator.calculate("-1,2") }
        .to raise_error("negative numbers not allowed -1")
    end

    it "shows all negative numbers" do
      expect { StringCalculator.calculate("-1,-2,3") }
        .to raise_error("negative numbers not allowed -1,-2")
    end
  end
end
