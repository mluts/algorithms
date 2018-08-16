NUMS = <<EOF.lines.map { |l| l.split.map(&:to_i) }
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
EOF

def best_route_at(rows, row, prev_col)
  nums = rows[row]

  [prev_col, prev_col + 1].max_by do |col|
    next_row = rows[row+1]

    if next_row
      next_col = best_route_at(rows, row + 1, col)
      nums[col] + next_row[next_col]
    else
      nums[col]
    end
  end
end

def main
  res = NUMS.each_with_index.each_with_object({}) do |(nums, row), acc|
    acc[:sum]  ||= 0
    acc[:cols] ||= []

    if acc[:cols].empty?
      acc[:cols] << 0
      acc[:sum] += nums[0]
      next
    end

    col = best_route_at(NUMS, row, acc[:cols].last)
    acc[:sum] += nums[col]
    acc[:cols] << col
  end

  puts "Sum: #{res[:sum]}"
end

main if $0 == __FILE__
