##########################################################################
def word
  words = Array.new()
  File.read("words.txt").each_line { |w| words << w }

  num_rand = rand(0..words.length-1)

  return words[num_rand]
end

a = File.open("man_test.txt", "wr")
puts a
