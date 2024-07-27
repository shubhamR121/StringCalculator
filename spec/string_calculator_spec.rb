require 'string_calculator'

RSpec.describe StringCalculator do
  subject(:calculator) { described_class }

  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add("")).to eq(0)
    end

    it 'returns the number for a single number' do
      expect(calculator.add("1")).to eq(1)
    end

    it 'returns the sum of two numbers' do
      expect(calculator.add("1,2")).to eq(3)
    end

    it 'returns the sum of multiple numbers' do
      expect(calculator.add("1,2,3")).to eq(6)
    end

    it 'handles new lines between numbers' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'throws an exception for negative numbers' do
      expect { calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
    end

    it 'throws an exception for multiple negative numbers' do
      expect { calculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2, -3")
    end

    it 'ignores numbers bigger than 1000' do
      expect(calculator.add("2+1001")).to eq(2)
    end

    it 'supports delimiters of any length' do
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'supports multiple delimiters' do
      expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'supports multiple delimiters with length longer than one char' do
      expect(calculator.add("//[***][%%%]\n1***2%%%3")).to eq(6)
    end    
  end
end
