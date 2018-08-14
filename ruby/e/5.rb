def divisible_by?(n, numbers)
  numbers.all? { |div| n % div == 0 }
end

def numbers_divisible_by(numbers)
  n = numbers.max + 1

  loop do
    yield n if divisible_by?(n, numbers)
    n += 1
  end
end

def main
  from, to = 1, 20
  num = to_enum(:numbers_divisible_by, (from..to).to_a).lazy.first
  puts "Smallest positive number divisible by numbers #{from}..#{to}: #{num}"
end

main if $0 == __FILE__
