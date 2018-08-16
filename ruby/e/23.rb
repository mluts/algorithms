def proper_divs(n)
  return to_enum(:proper_divs, n) unless block_given?

  half = n / 2
  (1..half).each { |div| yield div if n % div == 0 }
end

def num_type(n)
  divs_sum = proper_divs(n).reduce(:+)

  if divs_sum == n
    :perfect
  elsif divs_sum < n
    :deficient
  else
    :abundant
  end
end

def main

end

main if $0 == __FILE__
