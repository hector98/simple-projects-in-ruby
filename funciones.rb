def suma(a, b)
  return a + b
end

def resta(a, b)
  return a - b
end

def mul(a, b)
  return a * b
end

def div(a, b)
  a *= 1.0
  return a / b
end

def pot(a, b)
  return a ** b
end


def function(f, x)
  i, resu = 0, 0
  loop do
    cons, pot, valor, i_aux = 1, 1, 0, 0
    str_aux, cons_aux, pot_aux = "", "", ""
    while f[i] != ' '
      str_aux << f[i]
      i += 1
    end

    if f[i] == ' '
      unless str_aux.include?("x")
        valor += str_aux.to_f
      else
        valor = x
        if str_aux[0] != 'x'
          while i_aux < str_aux.length and str_aux[i_aux] != 'x'
            
              cons_aux << str_aux[i_aux]

            i_aux += 1
          end
          i_aux += 1
        end
        if str_aux[i_aux] == '^'
          i_aux += 1 
          loop do
            pot_aux << str_aux[i_aux]
            i_aux += 1
            break if i_aux == str_aux.length and str_aux[i_aux] != '^'
          end
        end
        cons = cons_aux.to_f
        pot = pot_aux.to_f
      end

      resu += cons * (valor ** pot)
    end

    i += 1
    break if i == f.length
  end
  return resu
end

puts "Escribe la funcion: "
func = gets.chomp
func << " "

puts "Escribe inicio de valores para x"
init = gets.chomp.to_f
puts "Escribe el final de valores para x"
fin = gets.chomp.to_f
puts "Escribe el valor de la secuencia"
steps = gets.chomp.to_f
a, b, c = 0, 0, 0

init.step(fin, steps) do |i|
  re_fun = function(func, i).round(4)

  if re_fun < 0
    a = i
    c = 1
  elsif re_fun > 0.0 and c != 0
    b = i
    break
  else
    c = 0
  end
end

if a == 0 and b == 0
  a, b = init, fin
end
    
i, x_r_ant = 1, 0.0
loop do
  puts "Iteracion ##{i}"
  puts "Xa = #{a} y Xb = #{b}"
  x_r = ((a + b)/2.0).round(4)
  puts "Xr = #{x_r}"
  e_p =((x_r - x_r_ant)/x_r).abs.round(4)*100

  fx_a = function(func, a)
  fx_r = function(func, x_r)

  if fx_a * fx_r < 0
    b = x_r
  else
    a = x_r
  end
  x_r_ant = x_r
  puts "Ep = #{e_p}%"

  i += 1
  break if e_p == 0
end

puts function(func, x_r_ant).round(2)
