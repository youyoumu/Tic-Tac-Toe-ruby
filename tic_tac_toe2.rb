# frozen_string_literal: true

class Player
  attr_accessor :name, :mark, :is_win

  def initialize(name, mark)
    @name = name
    @mark = mark
    @is_win = false
    @@board = Board.new
    @@game = Game.new
  end

  def self.print_board
    @@board.print_board
  end

  def take_turn(coordinate)
    if input_valid?(coordinate)
      @@board.draw(coordinate.to_i, @mark)
      if @@game.win?(@@board.board_array, @mark)
        @is_win = true
        puts "#{@name} wins"
      end
    else
      print 'Input Invalid! try again: '
      take_turn(gets.chomp)
    end
  end

  def input_valid?(coordinate)
    return true if Array(1..9).include?(coordinate.to_i) && @@board.coordinate_empty?(coordinate.to_i)

    false
  end
end

class Board
  attr_accessor :board_array

  def initialize
    @board_array = Array.new(3) { Array.new(3, ' ') }
  end

  def draw(coordinate, mark)
    @board_array[(coordinate - 1) / 3][(coordinate % 3) - 1] = mark
    print_board
  end

  def coordinate_empty?(coordinate)
    return true if @board_array[(coordinate - 1) / 3][(coordinate % 3) - 1] == ' '

    false
  end

  def print_board
    puts " #{@board_array[0][0]} | #{@board_array[0][1]} | #{@board_array[0][2]} "
    puts '---+---+---'
    puts " #{@board_array[1][0]} | #{@board_array[1][1]} | #{@board_array[1][2]} "
    puts '---+---+---'
    puts " #{@board_array[2][0]} | #{@board_array[2][1]} | #{@board_array[2][2]} "
  end
end

class Game
  def win?(board_array, mark)
    if win_horizontally?(board_array, mark) ||
       win_vertically?(board_array, mark) ||
       win_diagonally1?(board_array, mark) ||
       win_diagonally2?(board_array, mark)
      return true
    end

    false
  end

  def win_horizontally?(board_array, mark)
    mark_array = []
    i = 0
    while i < 3
      j = 0
      while j < 3
        mark_array.push(board_array[i][j])
        j += 1
      end
      return true if mark_array.uniq.length == 1 && (mark_array.uniq[0] == mark)

      mark_array.clear
      i += 1
    end
    false
  end

  def win_vertically?(board_array, mark)
    mark_array = []
    i = 0
    while i < 3
      j = 0
      while j < 3
        mark_array.push(board_array[j][i])
        j += 1
      end
      return true if mark_array.uniq.length == 1 && (mark_array.uniq[0] == mark)

      mark_array.clear
      i += 1
    end
    false
  end

  def win_diagonally1?(board_array, mark)
    mark_array = []
    i = 0
    while i < 3
      mark_array.push(board_array[i][i])
      i += 1
    end
    return true if mark_array.uniq.length == 1 && (mark_array.uniq[0] == mark)

    false
  end

  def win_diagonally2?(board_array, mark)
    mark_array = []
    i = 2
    j = 0
    while i > -1
      mark_array.push(board_array[i][j])
      i -= 1
      j += 1
    end
    return true if mark_array.uniq.length == 1 && (mark_array.uniq[0] == mark)

    false
  end
end

player1 = Player.new('Player 1', 'X')
player2 = Player.new('Player 2', 'O')
Player.print_board

until player1.is_win || player2.is_win
  print "#{player1.name}'s turn: "
  player1.take_turn(gets.chomp)
  break if player1.is_win

  print "#{player2.name}'s turn: "
  player2.take_turn(gets.chomp)
end
