def assert(cond, msg)
  puts "#{ cond ? "OK" : "FAILED" }: #{msg}"
end

def binary(arr, el)
  lb,rb = 0, arr.size-1
  i = rb/2

  while rb-lb >= 0
    case arr[i] <=> el
    when  1 then rb = i-1
    when  0 then return el
    when -1 then lb = i+1
    end

    i = (lb+rb)/2
  end

  return -1
end

arr1 = [1,7,9,100,101]
arr2 = 100.times.map { rand(1000) }.uniq.sort

assert binary(arr1, 7) == 7, "binary(arr1, 7) == 7"
assert binary(arr1, 8) == -1, "binary(arr1, 7) == -1"

el = arr2.sample
assert binary(arr2, el) == el, "binary(arr2, #{el}) == #{el}"
