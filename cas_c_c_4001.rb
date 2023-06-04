# 火山島(cas_c_c_4001)
count = gets.to_i
s, m, l = gets.split.map(&:to_i)
sum = 0

count.times do
  order = gets.chomp
  case order
  when 'SS'
    sum += s / 2
  when 'S'
    sum += s
  when 'M'
    sum += m
  when 'L'
    sum += l
  when 'LL'
    sum += l * 2
  end
end

puts sum
