def assert(cond, msg)
  puts "#{ cond ? "OK" : "FAILED" }: #{msg}"
end

def bigger_with_same_digits(num)
  nzeros = nfull = num = num.to_i
  rdigits = []
  return num if num <= 10

  loop do
    nzeros = (nfull/10)*10
    digit = nfull-nzeros
    nfull /= 10

    if rdigits.first && rdigits.first > digit
      bigger = rdigits.shift
      rdigits.unshift(bigger, digit)
      break
    else
      rdigits.unshift(digit)
    end

    break if nfull == 0
  end

  rdigits.inject(nfull) { |acc,d| acc*10+d }
end

[ 56, 128, 687, 9824, 867 ]
  .each do |i|
    res = bigger_with_same_digits(i)
    assert res > i && res.to_s.size == i.to_s.size, "#{res} > #{i}"
  end

[10, 1, 110, 10000, 9000, 876]
  .each do |i|
    res = bigger_with_same_digits(i)
    assert res == i, "#{res} == #{i}"
  end
