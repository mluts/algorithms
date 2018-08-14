def sum_of_sq(from, to)
  (from..to).reduce(0) { |acc, n| acc + (n ** 2) }.tap { |n| puts "sum of sq #{n}" }
end

def sq_of_sum(from, to)
  (from..to).sum ** 2
end

def main
  from = 1
  to = 100
  result = sum_of_sq(from, to) - sq_of_sum(from, to)
  puts "Difference between sum of sq and sq of sum: #{result.abs}"
end

main if $0 == __FILE__
