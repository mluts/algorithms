def prime?(n)
  if n < 12
    return [2, 3, 5, 7, 11].include?(n)
  end

  root = Math.sqrt(n).to_i
  return false if (root ** 2) == n
  (2..root).none? { |div| n % div == 0 }
end

def primes
  n = 2
  loop do
    yield n if prime?(n)
    n += 1
  end
end

def main
  primes = to_enum(:primes).lazy.take(10_001).to_a
  puts "6th prime: #{primes[5]}"
  puts "10_001th prime: #{primes.last}"
end

main if $0 == __FILE__
