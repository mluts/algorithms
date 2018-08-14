def fib
  n1 = 1
  n2 = 2
  yield n1
  yield n2

  loop do
    n3 = n1 + n2
    yield n3
    n1 = n2
    n2 = n3
  end
end

def main
  max = 4_000_000

  result = to_enum(:fib).lazy.take_while { |n| n <= max  }.reduce(0) do |acc, n|
    if n.even?
      acc + n
    else
      acc
    end
  end
  puts "Fib sum below #{max}: #{result}"
end

main if $0 == __FILE__
