def fact(n)
  (1..n).reduce(1, :*)
end

def binom(n, k)
  fact(n) / (fact(k) * fact(n - k)) 
end

def lattice_paths(size)
  binom(size * 2, size)
end

def main
  puts "Paths from 0,0 to 20,20: #{lattice_paths(20)}"
end

main if $0 == __FILE__
