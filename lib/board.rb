require "./lib/player.rb"

class Board
  attr_accessor :board_array

  def initialize(player1_name, player2_name, player1_mark, player2_mark)
    @board_array = Array.new(3) { Array.new(3, " ") }
    @player1 = Player.new(player1_name, player1_mark)
    @player2 = Player.new(player2_name, player2_mark)
  end

  def play
    print_board
    until game_over?
      take_turn_player1 unless game_over?
      @player1.is_win = true if game_over?
      take_turn_player2 unless game_over?
      @player2.is_win = true if game_over? && @player1.is_win == false
      announce_winner
    end
  end

  def announce_winner
    puts "#{@player1.name} Wins!" if @player1.is_win
    puts "#{@player2.name} Wins!" if @player2.is_win
  end

  def take_turn_player1
    name = @player1.name
    puts "#{name}'s turn: "
    coordinate = gets.chomp.to_i
    mark = @player1.mark
    draw(coordinate, mark)
  end

  def take_turn_player2
    name = @player2.name
    puts "#{name}'s turn: "
    coordinate = gets.chomp.to_i
    mark = @player2.mark
    draw(coordinate, mark)
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

  def game_over?
    mark_array = []
    board_array = @board_array

    #check horizontally
    i = 0
    while i < 3
      j = 0
      while j < 3
        mark_array.push(board_array[i][j])
        j += 1
      end
      if mark_array.uniq.length == 1
        if mark_array.uniq[0] == @player1.mark || mark_array.uniq[0] == @player2.mark
          return true
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
        if mark_array.uniq[0] == @player1.mark || mark_array.uniq[0] == @player2.mark
          return true
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
      if mark_array.uniq[0] == @player1.mark || mark_array.uniq[0] == @player2.mark
        return true
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
    if mark_array.uniq.length == 1
      if mark_array.uniq[0] == @player1.mark || mark_array.uniq[0] == @player2.mark
        return true
      end
    end
    mark_array.clear

    false
  end
end
