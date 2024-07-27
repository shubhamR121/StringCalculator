class StringCalculator

  def self.add(numbers)
    return 0 if numbers.empty?
    
    delimiter = /,|\n/
    
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2]
      numbers = parts[1]
    end

    nums = numbers.split(delimiter).map(&:to_i)
    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
    nums.reject { |n| n > 1000 }.sum
  end
end
