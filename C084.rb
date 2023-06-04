class C084
  @symbol = '+'

  def initialize
    @word = gets.chomp
    @length = @word.length
  end

  def run
    puts symbol * (@length + 2)
    puts symbol + @word + symbol
    puts symbol * (@length + 2)
  end

  def symbol
    self.class.symbol
  end

  def self.symbol
    @symbol
  end
end

c084 = C084.new
c084.run
