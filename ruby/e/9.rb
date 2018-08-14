def pythagorean_triplets
  step = 10
  loop do
    n1 = 1
    n2 = n1 + 1
    (n1...(n1 + step)).each do |a|
      (n2..(n2 + step)).each do |b|
        as = a**2
        bs = b**2
        cs = as + bs
        c = Math.sqrt(cs)

        yield [a, b, c] if (c.to_i == c)
      end
    end
    step += 10
  end
end

def main
  found = 0
  triplet = to_enum(:pythagorean_triplets).lazy.detect do |(a,b,c)|
    found += 1
    puts "#{found} triplets found"
    a + b + c == 1000
  end
  product = triplet.reduce(1, :*)
  puts "Triplet: #{triplet.join(', ')}"
  puts "Product of abc in a + b + c = 1000, is: #{product}"
end

main if $0 == __FILE__
