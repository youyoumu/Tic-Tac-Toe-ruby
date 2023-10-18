# frozen_string_literal: true

# class for player1 and player2
class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def take_turn
    print "#{@name}'s turn: "
    selection = gets.chomp

  end
end

# display class
class Display
  attr_accessor :display_array

  def initialize
    @display_array = Array.new(9, '')
  end

  def draw_on(selection)

  end

  def generate_display
    puts "#{@display_array[0]} | #{@display_array[1]} | #{@display_array[2]}"
    puts '--+---+--'
    puts "#{@display_array[3]} | #{@display_array[4]} | #{@display_array[5]}"
    puts '--+---+--'
    puts "#{@display_array[6]} | #{@display_array[7]} | #{@display_array[8]}"
  end
end

# game class
class Game

  def start_game

  end

  def player1_turn


  end

  def player2_turn

  end
end

d1 = Display.new
g1 = Game.new
print 'Enter Player 1 Name: '
player1 = Player.new("yym")
print 'Enter Player 2 Name: '
player2 = Player.new("ddm")
player1.take_turn
p d1.display_array
