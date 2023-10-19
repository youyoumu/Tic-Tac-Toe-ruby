# frozen_string_literal: true

# class for player1 and player2
class Player
  attr_accessor :name, :mark, :is_win

  @@display_array = Array.new(9, ' ')

  def initialize(name)
    @name = name
    @is_win = false
  end

  def take_turn
    print "#{@name}'s turn: "
    selection = gets.chomp.to_i
    if Array(1..9).include?(selection)
      draw_on(selection, @mark)
    else
      puts 'Invalid input!'
      take_turn
    end
  end

  def draw_on(selection, mark)
    if @@display_array[selection - 1] == ' '
      @@display_array[selection - 1] = mark
      Player.generate_display
      check_status
    else
      puts "You can't draw on that grid!"
      take_turn
    end
  end

  def self.generate_display
    puts "#{@@display_array[0]} | #{@@display_array[1]} | #{@@display_array[2]}"
    puts '--+---+--'
    puts "#{@@display_array[3]} | #{@@display_array[4]} | #{@@display_array[5]}"
    puts '--+---+--'
    puts "#{@@display_array[6]} | #{@@display_array[7]} | #{@@display_array[8]}"
  end

  def check_status
    if (@@display_array[0] == 'X' && @@display_array[1] == 'X' && @@display_array[2] == 'X') ||
       (@@display_array[3] == 'X' && @@display_array[4] == 'X' && @@display_array[5] == 'X') ||
       (@@display_array[6] == 'X' && @@display_array[7] == 'X' && @@display_array[8] == 'X') ||
       (@@display_array[0] == 'X' && @@display_array[3] == 'X' && @@display_array[6] == 'X') ||
       (@@display_array[1] == 'X' && @@display_array[4] == 'X' && @@display_array[7] == 'X') ||
       (@@display_array[2] == 'X' && @@display_array[5] == 'X' && @@display_array[8] == 'X') ||
       (@@display_array[0] == 'X' && @@display_array[4] == 'X' && @@display_array[8] == 'X') ||
       (@@display_array[2] == 'X' && @@display_array[4] == 'X' && @@display_array[6] == 'X') ||

       (@@display_array[0] == 'O' && @@display_array[1] == 'O' && @@display_array[2] == 'O') ||
       (@@display_array[3] == 'O' && @@display_array[4] == 'O' && @@display_array[5] == 'O') ||
       (@@display_array[6] == 'O' && @@display_array[7] == 'O' && @@display_array[8] == 'O') ||
       (@@display_array[0] == 'O' && @@display_array[3] == 'O' && @@display_array[6] == 'O') ||
       (@@display_array[1] == 'O' && @@display_array[4] == 'O' && @@display_array[7] == 'O') ||
       (@@display_array[2] == 'O' && @@display_array[5] == 'O' && @@display_array[8] == 'O') ||
       (@@display_array[0] == 'O' && @@display_array[4] == 'O' && @@display_array[8] == 'O') ||
       (@@display_array[2] == 'O' && @@display_array[4] == 'O' && @@display_array[6] == 'O')

      @is_win = true
    end

    return unless @is_win

    puts "#{@name} wins"
  end
end

puts 'Enter Player 1 Name: '
player1 = Player.new(gets.chomp)
player1.mark = 'X'
puts 'Enter Player 2 Name: '
player2 = Player.new(gets.chomp)
player2.mark = 'O'
Player.generate_display

until player1.is_win || player2.is_win
  player1.take_turn
  break if player1.is_win || player2.is_win

  player2.take_turn
end
