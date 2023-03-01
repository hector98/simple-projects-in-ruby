def bin_dec(n)

  pot = 0
  dec = 0

  n.reverse.each_char do |i|
    dec += i.to_i*(2**pot)
    pot += 1

  end
  return dec
end

def comple(n1, n2)
  #n1.reverse! if n1.length > 1
 # n2.reverse! if n2.length > 1

  while n1.length != n2.length
    if n1.length > n2.length
      n2 += '0'
    else
      n1 += '0'
    end
  end

  return n1, n2
end

def sum_bin(n1, n2)

  n1, n2 = comple(n1.reverse, n2.reverse)

  r = ""
  aux = '0'
  n = 0

  while  n < n1.length
    if n1[n] == '1' and n2[n] == '1'
      if aux == '1'
        r += '1'
        aux = '1'
      else
        r += '0'
        aux = '1'
      end
    elsif n1[n] == '0' and n2[n] == '0'
      if aux == '1'
        r += '1'
        aux = '0'
      else
        r += '0'
      end
    elsif n1[n] == '1'  or n2[n] == '1'
      if aux == '1'
        r += '0'
      else
        r += '1'
      end
    end
    n += 1
  end
  
  r += '1' if aux == '1'
  return r.reverse
end

def res_bin(n1_aux, n2_aux)
  n1, n2 = comple(n1_aux.reverse, n2_aux.reverse)
  n1.reverse!
  n2.reverse!
  cont = 0
 
  while cont < n2.length
    if n2[cont] == '1'
      n2[cont] = '0'
    else
      n2[cont] = '1'
    end
    cont += 1
  end
  suma1 = sum_bin(n1, n2)
  
  resta_aux = sum_bin(suma1, '1').reverse
  resta = ""
  n = 0
  while n<resta_aux.length - 1
    resta += resta_aux[n]
    n += 1
  end

  return resta.reverse
end

puts "Escribe un numero binario"
a = gets.chomp
puts "Escribe otro numero binario para la suma y la resta"
b = gets.chomp

a_dec = bin_dec(a)
b_dec = bin_dec(b)

suma_bi = sum_bin(a, b)
rest_bi = res_bin(a, b)
suma_de = a_dec + b_dec
res_de = a_dec - b_dec

puts "Primer numero binario a decimal #{ a_dec } "
puts "Segundo numero binario a decimal #{ b_dec }"

puts

puts "Suma Binaria = #{ suma_bi }"
puts "Suma Decimal = #{ suma_de }"
puts
puts "Resta Binaria = #{ rest_bi }"
puts "Resta Decimal = #{ res_de }"
