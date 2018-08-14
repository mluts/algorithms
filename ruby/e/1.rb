class Integer
  def mult_of?(n)
    self % n == 0
  end
end

def main
  result = (1...1000).reduce(0) do |acc, n|
    if n.mult_of?(3) || n.mult_of?(5)
      acc + n
    else
      acc
    end
  end

  puts "Multiplies of 3 and 5 below 1000: #{result}"
end

main if $0 == __FILE__
