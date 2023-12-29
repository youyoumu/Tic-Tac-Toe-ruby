class Player
  attr_accessor :name, :mark, :is_win

  def initialize(name, mark)
    @name = name
    @mark = mark
    @is_win = false
  end
end
