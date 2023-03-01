3.times { puts "Hello" }

3.times { |count| puts count }

3.times do |running_count|
  puts "The current count is #{running_count}"
  puts "Hector is wonderful"
end
