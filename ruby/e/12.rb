#!/usr/bin/env ruby

module TriangleNums
  module_function

  def known
    @known ||= {}
  end

  def triangle_number(n)
    if (k = known[n-1])
      known[n] = n + k
    else
      known[n] = (1..n).sum
    end
  end

  def triangle_numbers
    return to_enum(:triangle_numbers) unless block_given?

    n = 1

    loop do
      yield triangle_number(n)
      n += 1
    end
  end
end

def divisors(n)
  return to_enum(:divisors, n) unless block_given?

  m = n

  while m % 2 == 0
    yield 2
    m /= 2
  end

  f = 3
  while f * f <= m
    if m % f == 0
      yield f
      m /= f
    else
      f += 2
    end
  end

  yield m unless m == 1
end

def number_of_divisors(n)
  divisors(n).reduce({}) do |acc, div|
    acc[div] ||= 0
    acc[div] += 1
    acc
  end.reduce([]) { |acc, (_div, exp)| acc << (exp + 1) }
     .reduce(1, :*)
end

def main
  max_div = 0
  num = TriangleNums.triangle_numbers.lazy.detect do |tn|
    divs_n = number_of_divisors(tn)
    new_max_div = [max_div, divs_n].max
    puts new_max_div if new_max_div != max_div
    max_div = new_max_div
    divs_n > 500
  end
  puts "Triangle number: #{num}"
end

main if $0 == __FILE__ || File.basename($0) == 'ruby-prof'
