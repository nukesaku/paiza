# case文のwhenの中に比較演算子
i = 20
case
when i >= 21
  puts "21以上"
when i >= 0
  puts "0以上"
else
  puts "other"
end

# procオブジェクトの実行あれこれ
add_proc = Proc.new { |a, b| a + b }
## callメソッドで実行
p add_proc.call(10, 20) #=> 30
## yieldメソッドで実行
p add_proc.yield(10, 20) #=> 30
## .()で実行
p add_proc.(10, 20) #=> 30
## []で実行
p add_proc[10, 20] #=> 30
## ===で実行
p add_proc === [10, 20] #=> 30

# procがなぜ===で実行できるのか => case文のwhen節で使えるようにする為
## Procオブジェクトを使ったcase文
def judge(age)
  # 20より大きければtrueを返すProcオブジェクト
  adult = Proc.new { |n| n > 20 }
  # 20より小さければtrueを返すProcオブジェクト
  child = Proc.new { |n| n < 20 }

  case age
    when adult
      puts "大人です"
    when child
      puts "子供です"
    else
      puts "二十歳です"
  end
end

judge(25) #=> "大人です"
judge(18) #=> "子供です"
judge(20) #=> "はたちです"
