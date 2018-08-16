NAMES = IO.read('/tmp/names.txt').split(',').sort.map { |n| n.gsub('"', '').downcase }

def ab
  $_ab ||= ('a'..'z').map { |c| [c, c.ord - 'a'.ord + 1] }.to_h
end

def ab_value(name)
  name.gsub('"', "").chars.map { |c| ab[c] }.reduce(0, :+)
end

def main
  total = 0

  NAMES.each_with_index do |name, i|
    total += (i + 1) * ab_value(name)
  end

  puts "Total scores: #{total}"
end

main if $0 == __FILE__
