##########################################################################

$TOTAL_PARTIDAS = 0
$PARTIDAS_GANADAS = 0
def word
  words = Array.new()
  File.read("words.txt").each_line { |w| words << w }

  num_rand = rand(0..words.length-1)

  return words[num_rand]
end

def man
  man_a = Array.new()
  File.read("man.txt").each_line { |m| man_a << m }

  return man_a
end

def game
  $TOTAL_PARTIDAS += 1
  wor = word.chomp.downcase
  word_s = ""
  wor.chomp.each_char { |c| word_s << '_' }
  inten = 0
  letras = ""
  loop do
    lim_inten = (man.length + 1) / 2
    puts "Juego del ahorcado\nAdivina la palabra"
    puts "Palabra: #{word_s}" 
    puts "Letras usadas ya: [#{letras}]"

    i = 0
    while i < inten + 1
      puts man[i]
      i += 1
    end
  
    puts "#{inten} de #{lim_inten} Intentos"
    puts "Escribe una letra: "
    letra = gets.chomp.downcase
    unless letras.include?(letra)
      letras << letra
      if wor.include?(letra)
        i = 0
        while i < wor.length
          if wor[i] == letra
            word_s[i] = letra
          end
          i += 1
        end
      else
        inten += 1
      end
    else
      puts "Intenta otra letra que no se repita"
    end

    if word_s == wor
      $PARTIDAS_GANADAS += 1
      puts "Felicitaciones Ganaste"
      puts "La palabra es #{wor} "
      break
    elsif lim_inten == inten
      puts "Perdiste, Excediste el numero de intentos"
      break
    end
    system('clear')
  end

end

loop do
  system("clear")
  game
  puts "Total de partidas: #{$TOTAL_PARTIDAS}"
  puts "Partidas ganadas: #{$PARTIDAS_GANADAS}"
  puts "Partidas perdidas: #{$TOTAL_PARTIDAS - $PARTIDAS_GANADAS}"
  puts "Deseas volver a jugar ? s/n"
  r = gets.chomp.downcase

  break unless r == 's'
end

puts "Bye Bye"
