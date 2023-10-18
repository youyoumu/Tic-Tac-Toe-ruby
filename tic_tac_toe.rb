class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end

end

class Display
  attr_accessor :display_array
  def initialize()
    @display_array = Array.new(9, " ")
  end

  def generate_display()
    puts "#{@display_array[0]} | #{@display_array[1]} | #{@display_array[2]}"
    puts "--+---+--"
    puts "#{@display_array[3]} | #{@display_array[4]} | #{@display_array[5]}"
    puts "--+---+--"
    puts "#{@display_array[6]} | #{@display_array[7]} | #{@display_array[8]}"
  end
end

d1 = Display.new()
d1.generate_display
