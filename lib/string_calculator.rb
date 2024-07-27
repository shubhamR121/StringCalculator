class StringCalculator

  def self.add(numbers)
    return 0 if numbers.empty?
    
    delimiter = /,|\n/
    
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = extract_delimiters(parts[0])
      numbers = parts[1]
    end

    nums = numbers.split(Regexp.union(delimiter)).map(&:to_i)
    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
    nums.reject { |n| n > 1000 }.sum
  end

  def self.extract_delimiters(header)
    if header.include?('[')
      header.scan(/\[(.*?)\]/).flatten.map { |d| Regexp.new(Regexp.escape(d)) }
    else
      Regexp.escape(header[2])
    end
  end
end
