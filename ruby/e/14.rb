def collatz_seq(n)
  return to_enum(:collatz_seq, n) unless block_given?

  loop do
    yield n
    return if n == 1
    n =
      if n.even?
        n / 2
      else
        3 * n + 1
      end
  end
end

def main
  max_start = (1...1_000_000).max_by { |n| collatz_seq(n).count }
  puts "Max starting point: #{max_start}"
end

main if $0 == __FILE__
