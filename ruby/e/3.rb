module Primes
  module_function

  def known_primes
    @known_primes ||= { 2 => false, 3 => true }
  end

  def prime?(n)
    if !(bool = known_primes[n]).nil?
      return bool
    end

    root = Math.sqrt(n).to_i
    if (root ** 2) == n
      return (known_primes[n] = false)
    end

    is_prime = (2..root).none? { |div| n % div == 0 }
    return (known_primes[n] = is_prime)
  end

  def primes
    n = 3
    loop do
      yield n if prime?(n)
      n += 1
    end
  end

  def prime_factors(n)
    root = Math.sqrt(n).to_i
    return root if (root ** 2) == n

    if block_given?
      to_enum(:primes)
        .lazy
        .take_while { |prime| prime <= root }
        .each{ |prime| yield prime if n % prime == 0 }
    else
      to_enum(:prime_factors, n)
    end
  end
end

def main
  number = 600851475143
  factors = Primes.prime_factors(number).to_a
  puts "Prime factors of #{number}: #{factors.join(', ')}"
end

main if $0 == __FILE__
