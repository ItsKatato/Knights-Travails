# Frozen_String_Literal: false

# This program shows the shortest path for the knight in chess to get from one square of the board to another.

# Class Board
# Boundaries for left/right >= 1 <= 8
# Boundaries for top/bottom >=1 <= 8

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def invalid?(array)
    if array[0] < 1 || array[0] > 8
      true
    elsif array[1] < 1 || array[1] > 8
      true
    else
      false
    end
  end
end

class Node
  include Comparable
  attr_accessor :data, :up, :left, :down, :right

  def initialize(data)
    @data = data
    @poss_moves = []
  end
end

# Class Knight
class Knight
  attr_accessor :root

  def initialize(start)
    @root = start
  end
end