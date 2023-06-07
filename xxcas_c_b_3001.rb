# 大海の渦(cas_c_b_3001)
# 入力例
# 5  7
# 9 10 6 7 6
# 出力例
# 7  2 1 3 3
N, x_1 = gets.split.map(&:to_i)
x = [x_1]
d = gets.split.map(&:to_i)

for i in 0...(d.length - 1)
  next x[i + 1] = d[i] - x[i] if (i === 0)
  x[i + 1] = d[i] - x[i] - x[i - 1] 
end

puts x.join(' ')
