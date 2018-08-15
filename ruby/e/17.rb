require 'humanize'

def main
  length = (1..1000).map(&:humanize).join.gsub(/-|\s/, "").chars.count
  puts "Length of 1..1000 in words: #{length}"
end

main if $0 == __FILE__
