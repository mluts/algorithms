def assert(cond, msg)
  puts "#{ cond ? "OK" : "FAILED" }: #{msg}"
end

def bigger_with_same_digits(num)
  nzeros = nfull = num = num.to_i
  rdigits = []

  loop do
    return num if num <= 10

    nzeros = (nfull/10)*10
    digit = nfull-nzeros

    if nfull == 0
      break
    elsif rdigits.first && rdigits.first > digit
      bigger = rdigits.shift
      rdigits.unshift(digit)
      rdigits.unshift(bigger)
      break
    else
      rdigits.unshift(digit)
    end

    nzeros = nfull = nfull/10
  end

  rdigits.inject(nfull) { |acc,d| acc*10+d }
end

[ 56, 128, 687, 9824 ]
  .each do |i|
    res = bigger_with_same_digits(i)
    assert res > i, "#{res} > #{i}"
  end

[10, 1, 110, 10000, 9000]
  .each do |i|
    res = bigger_with_same_digits(i)
    assert res == i, "#{res} == #{i}"
  end
