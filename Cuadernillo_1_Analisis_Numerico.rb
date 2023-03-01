def Fahrenheit(celsius)
  f = (celsius * 9/5.0) + 32
  return f
end

def ErrorAbsoluto(v_real, aprox)
  e_a  = (v_real - aprox).abs()
  return e_a.round(4)
end

def ErrorRelativo(v_real, e_absoluto)
  if e_absoluto > 0
    e_r = (e_absoluto / v_real) * 100
    return e_r
  else
    return 0
  end
end

loop do
  system("clear")
  puts "----Conversor de grados Centigrados a Fahrenheit----"

  puts "Escribe los grados celsius a convertir: "
  c = gets.chomp.to_f
  f = Fahrenheit(c)

  puts "Valor Real #{f} "

  redondeo = f.round(2)
  puts "Valor Redondeado a dos decimas #{redondeo}"
  error_a_r = ErrorAbsoluto(f, redondeo)
  puts "Error Absoluto en redondeo #{ error_a_r }"
  error_r_r = ErrorRelativo(f, error_a_r)
  puts "Error Relativo en redondeo #{ error_r_r.round(4) }%"

  truncamiento  = f.truncate(2)
  puts "Valor Truncado a dos decimas #{truncamiento}"
  error_a_t = ErrorAbsoluto(f, truncamiento)
  puts "Error Absoluto en Truncamiento: #{ error_a_r }"
  error_r_t = ErrorRelativo(f, error_a_t)
  puts "Error Relativo en Truncamiento: #{ error_r_t.round(4) }%"

  puts "Volver a convertir s/n?"
  volver = gets.chomp
  break unless volver == 's' or volver == 'S'

end

puts "Bye Bye!!!"

