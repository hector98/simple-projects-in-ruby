def password(t)
  str = "`1234567890-=qwertyuiop[]\asdfghjkl;'zxcvbnm,./~!@#$%^&*()+_"
  pass = ""
  while t > 0
    num_rand = rand(0..str.length-1)
    pass += str[num_rand]
    t -= 1
  end

  return pass
end

def main
  puts "Generador basico de contraseñas"
  puts"Escribe la longitud que deseas en tu nueva contraseña: "
  lon = gets.chomp.to_i

  puts "Tu nueva contraseña es:\n\t #{password(lon)}\n"
end

loop do
  system('clear')
  main

  puts "Deseas generar otra contraseña? s/n?"
  r = gets.chomp.downcase

  break unless r == 's'
end
puts "Bye Bye"
