#!/usr/bin/env ruby

# クロージャ(closure, 関数閉包)
def closure(array)
  counter = 0
  # Procオブジェクトをメソッドの戻り値とする
  Proc.new do
    # ローカル変数のcounterを加算する
    counter += 10
    # メソッド引数のarrayにcounterの値を追加する
    array << counter
  end
end

values = []
proc = closure(values)
p values # => []
# Procオブジェクトを実行するとgenerate_procメソッドの引数だったvaluesの中身が書き換えられる
proc.call
p values # => [10]
# generate_procメソッド内のローカル変数counterも加算され続ける
proc.call
p values # => [10, 20]
