# Procオブジェクトをブロックとして渡したい場合は、引数の前に&をつける
reverse_proc = Proc.new { |s| s.reverse }
# mapメソッドにブロックを渡す代わりに、Procオブジェクトを渡す(ただし&が必要)
# &の役割はProcオブジェクトをブロックとして認識させるだけではない。厳密には右辺のオブジェクト(reverse_proc)に
# 対してto_procメソッドを呼び出し、その戻り値をブロックとして受け付ける
p ['Ruby', 'Java', 'Perl'].map(&reverse_proc) #=> ["ybuR", "avaJ", "lreP"]

# また、Procオブジェクトにto_procメソッドを呼んでも自分自身が返るだけである
reverse_proc = Proc.new { |s| s.reverse }
other_proc = reverse_proc.to_proc
p reverse_proc.equal?(other_proc) #=> true

# Procオブジェクト以外にto_procメソッドを持つものがある。その１つがシンボル。
# シンボルを変換してできたProcオブジェクトは、実行時に引数として渡されたレシーバーに対して、そのシンボルで指定されたメソッドを呼び出す
split_proc = :split.to_proc
p split_proc #=> #<Proc:0x00007f9b9a8b1a38(&:split)>
p split_proc.call('a-b-c-d e') #=> ["a-b-c-d", "e"]
# 引数を２つ渡すと、第一引数をレシーバー、第二引数を引数としてメソッドを呼び出す
p split_proc.call('a-b-c-d e', '-') #=> ["a", "b", "c", "d e"]
# つまりシンボル自身はレシーバに対して呼び出すメソッドの名前になる

p ['ruby', 'java', 'perl'].map(&:upcase) #=> ["RUBY", "JAVA", "PERL"]
# 1. &:upcaseは、シンボルの:upcaseに対してto_procメソッドを呼び出す
# 2. シンボルの:upcaseがProcオブジェクトに変換され、mapメソッドのブロックとして渡される
# 3. Procオブジェクトはmapメソッドから配列の各要素を実行時の第1引数として受け取る。
#    第1引数はupcaseメソッドのレシーバーとなる。
