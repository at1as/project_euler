require 'net/http'
require 'nokogiri'


text   = Net::HTTP.get(URI("https://github.com/at1as/project_euler"))
html   = Nokogiri::HTML(text)
labels = html.xpath('//a[contains(text(), "problem_")]')


puts "\nMissing from the first 50 problems:\n"
remaining_problems = (1..50).to_a - labels.map { |x| x.inner_html }.map { |x| x.match(/problem_([0-9]*).rb/).captures.first }.map(&:to_i)

puts remaining_problems.map {|x| "  #{x}"}

puts "\n#{remaining_problems.length}/50 problems left"


__END__

Output from last run:

Missing from the first 50 problems:
  15
  22
  23
  26
  27
  31
  35
  39
  43
  44
  45
  46
  47
  49
  50

15/50 problems left

