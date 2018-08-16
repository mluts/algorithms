def fact(n)
  (1..n).reduce(:*)
end

def digits(n)
  n.to_s(10).chars.map(&:to_i).reduce(:+)
end

def main
  d = digits(fact(100))
  puts "Sum of digits in 100!: #{d}"
end

main if $0 == __FILE__
