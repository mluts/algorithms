def divs(n)
  return to_enum(:divs, n) unless block_given?

  while n % 2 == 0
    yield 2
    n /= 2
  end

  f = 3
  while f*f <= n
    if n % f == 0
      yield f
      n /= f
    else
      f += 2
    end
  end

  yield n unless n == 1
end

def proper_divs(n, &block)
  return to_enum(:proper_divs, n) unless block_given?

  half = n / 2

  (1..half).each { |div| yield div if n % div == 0 }
end

def psum(n)
  proper_divs(n).reduce(:+)
end

def amicable_numbers
  return to_enum(:amicable_numbers) unless block_given?

  n = 2

  loop do
    n2 = psum(n)
    yield n if n2 != n && psum(n2) == n

    n += 1
  end
end

def main
  sum = amicable_numbers.lazy.take_while { |n| n < 10_000 }.reduce(:+)

  puts "Sum of amicable nums under 10000: #{sum}"
end

main if $0 == __FILE__
