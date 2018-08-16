def leap?(y)
  if century?(y)
    y % 400 == 0
  else
    y % 4 == 0
  end
end

def century?(y)
  (y / 100) * 100 == y
end

def days_in_month(y, m)
  if [4,6,9,11].include?(m)
    30
  elsif m == 2
    leap?(y) ? 29 : 28
  else
    31
  end
end

def next_date(y, m, d, wd)
  if d > days_in_month(y, m)
    if m == 12
      [y + 1, 1, 1, next_wday(wd)]
    else
      [y, m + 1, 1, next_wday(wd)]
    end
  else
    [y, m, d + 1, next_wday(wd)]
  end
end

def next_wday(wday)
  wday == 7 ? 1 : (wday + 1)
end

def sunday?(weekday)
  weekday == 7
end

def main
  date = [1900,1,1,1]

  sundays = 0

  loop do
    y,_m,d,wd = date
    break if y > 2000

    if (1901..2000).include?(y) && sunday?(wd) && d == 1
      sundays += 1
    end

    date = next_date(*date)
  end

  puts "Sundays from 1901..2000: #{sundays}"
end

main if $0 == __FILE__
