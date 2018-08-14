def prime?(n)
  if n < 12
    return [2, 3, 5, 7, 11].include?(n)
  end

  root = Math.sqrt(n).to_i
  (2..root).none? { |div| n % div == 0 }
end

def primes
  return to_enum(:primes) unless block_given?

  n = 2
  loop do
    yield n if prime?(n)
    n += 1
  end
end

def main
  sum = primes.lazy.take_while { |n| n < 2_000_000 }.reduce(0, :+)
  puts "Sum of all primes below 2_000_000: #{sum}"
end

main if $0 == __FILE__
