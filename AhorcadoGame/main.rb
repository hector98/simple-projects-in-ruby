##########################################################################
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
  wor = word.chomp.downcase
  word_s = ""
  wor.chomp.each_char { |c| word_s << '_' }
  inten = 0
  loop do
    lim_inten = man.length + 1
    puts "Juego del ahorcado\nAdivina la palabra"
    puts "Palabra: #{word_s}" 

    i = 0
    while i < inten
      puts man[i]
      i += 1
    end
  
    puts "#{inten} de #{lim_inten} Intentos"
    puts "Escribe una letra: "
    letra = gets.chomp.downcase
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

    if word_s == wor
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
  game
  puts "Deseas volver a jugar ? s/n"
  r = gets.chomp.downcase

  break unless r == 's'
end

puts "Bye Bye"
