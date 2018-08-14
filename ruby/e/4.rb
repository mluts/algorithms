def pairs(range_start, range_end)
  (range_start..range_end).each do |n|
    (range_start..range_end).each { |n2| yield [n, n2] }
  end
end

def palindrome?(n)
  chars = n.to_s.chars
  return false unless chars.size % 2 == 0
  half = chars.size / 2
  left, right = chars[0...half], chars[half..-1]
  left == right.reverse
end

def main
  max_product = to_enum(:pairs, 100, 999).lazy.reduce(0) do |max, (n1, n2)|
    res = n1 * n2
    if palindrome?(res)
      [max, res].max
    else
      max
    end
  end

  puts "Largest palindrome product of 3-digit numbers: #{max_product}"
end

main if $0 == __FILE__
