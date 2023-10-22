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

  def take_turn(coordinate)
    @@board.draw(coordinate, @mark)
    @@game.check_winner(@@board.board_array)
  end
end

class Board
  attr_accessor :board_array

  def initialize
    @board_array = Array.new(3) { Array.new(3, " ") }
  end

  def draw(coordinate, mark)
    @board_array[(coordinate - 1) / 3][(coordinate % 3) - 1] = mark
    print_board
  end

  def print_board
    puts " #{@board_array[0][0]} | #{@board_array[0][1]} | #{@board_array[0][2]} "
    puts "---+---+---"
    puts " #{@board_array[1][0]} | #{@board_array[1][1]} | #{@board_array[1][2]} "
    puts "---+---+---"
    puts " #{@board_array[2][0]} | #{@board_array[2][1]} | #{@board_array[2][2]} "
  end
end

class Game
  def check_winner(board_array)
    mark_array = []
    win = false

    #check horizontally
    i = 0
    while i < 3
      j = 0
      while j < 3
        mark_array.push(board_array[i][j])
        j += 1
      end
      if mark_array.uniq.length == 1
        if mark_array.uniq[0] == "X"
          puts "you win"
        end
      end
      mark_array.clear
      i += 1
    end

    #check vertically
    i = 0
    while i < 3
      j = 0
      while j < 3
        mark_array.push(board_array[j][i])
        j += 1
      end
      if mark_array.uniq.length == 1
        if mark_array.uniq[0] == "X"
          puts "you win"
        end
      end
      mark_array.clear
      i += 1
    end

    #check diagonally1
    i = 0
    while i < 3
      mark_array.push(board_array[i][i])
      i += 1
    end
    if mark_array.uniq.length == 1
      if mark_array.uniq[0] == "X"
        puts "you win"
      end
    end
    mark_array.clear

    #check diagonally2
    i = 2
    j = 0
    while i > -1
      mark_array.push(board_array[i][j])
      i -= 1
      j += 1
    end
    p mark_array
    if mark_array.uniq.length == 1
      if mark_array.uniq[0] == "X"
        puts "you win"
      end
    end
    mark_array.clear

    return win
  end
end

player1 = Player.new("Player 1", "X")
player2 = Player.new("Player 2", "O")

player1.take_turn(1)
player1.take_turn(5)
player1.take_turn(9)
