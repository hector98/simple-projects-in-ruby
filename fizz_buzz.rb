puts "escribe el inicio"
ini = gets.chomp.to_i
puts "escribe el final"
fin = gets.chomp.to_i

ini, fin = fin, ini if ini > fin

loop do
  if ini % 3 == 0 and ini % 4 == 0 
    puts "FizzBuzz"
  elsif ini % 3 == 0
    puts "Fizz"
  elsif ini % 4 == 0
    puts "Buzz"
  else
    puts ini
  end

  ini += 1

  break if ini == fin
end
