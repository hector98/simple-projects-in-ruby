
go_back = "s"

loop do
  system("clear")
  intentos = 0
  numero = rand(0..100)
  loop do
    puts "Adivina el numero del 0 al 100"
    num_user = gets.chomp.to_i
    
    if num_user == numero 
      puts "Felicitaciones Adivinaste el numero en el intento #{intentos}"
      break
    elsif num_user > numero
      puts "El numero es menor a #{num_user}"
    else
      puts "El numero es mayor a #{num_user}"
    end
    intentos += 1
  end
  puts "Deseas volver adivnar otro numero? s/n"
  go_back = gets.chomp.downcase
  break if go_back != 's'
end

puts "Bye Bye"
