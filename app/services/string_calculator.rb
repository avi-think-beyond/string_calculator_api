class StringCalculator
  def self.calculate(numbers)
    return 0 if numbers.strip.empty?

    delimiter = ",|\n"
    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      custom = delimiter_line[2..]
      delimiter = Regexp.escape(custom)
    end

    nums = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = nums.select { |n| n < 0 }

    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    nums.sum
  end
end
