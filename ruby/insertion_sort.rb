def assert(cond, msg)
  puts "#{ cond ? "OK" : "FAILED" }: #{msg}"
end

def insertion(arr)
  (1...arr.size).each do |i|
    x = arr[i]
    j = i
    while j > 0 && arr[j-1] > x
      arr[j] = arr[j-1]
      j -= 1
    end
    arr[j] = x
  end
  arr
end

ary = 10.times.map { rand(1000) }.shuffle
assert(insertion(ary.dup) == ary.sort, "insertion(ary) == #{ary.sort.inspect}")
