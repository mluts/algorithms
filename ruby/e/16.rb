def main
  n = 2
  exp = 1000
  sum = (n ** exp).to_s.chars.map(&:to_i).sum
  puts "Sum of digits 2^1000: #{sum}"
end

main if $0 == __FILE__
