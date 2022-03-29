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

  def self.invalid?(array)
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
  attr_accessor :data, :connected_spaces, :visited

  def initialize(data)
    @data = data
    @connected_spaces = []
    @visited = false
  end
end

# Class Knight
class Knight
  attr_accessor :root, :starting_space

  def initialize
    # @starting_space = start
    # @root = possible_moves(starting_space)
  end

  def possible_moves(start_space, visited = [])
    return if start_space.empty? || Board.invalid?(start_space) || start_space.nil? || visited.include?(start_space)

    root = Node.new(start_space)

    visited << start_space
    # left
    left_up = possible_moves([(start_space[0] - 2), (start_space[1] + 1)], visited) # up
    left_down = possible_moves([(start_space[0] - 2), (start_space[1] - 1)], visited) # down

    root.connected_spaces << left_up unless left_up.nil?

    root.connected_spaces << left_down unless left_down.nil?



    # right
    right_up = possible_moves([(start_space[0] + 2), (start_space[1] + 1)], visited) # up
    right_down = possible_moves([(start_space[0] + 2), (start_space[1] - 1)], visited) # down

    root.connected_spaces << right_up unless right_up.nil?
    root.connected_spaces << right_down unless right_down.nil?

    # up
    up_left = possible_moves([(start_space[0] - 1), (start_space[1] + 2)], visited) # left
    up_right = possible_moves([(start_space[0] + 1), (start_space[1] + 2)], visited) # right

    root.connected_spaces << up_left unless up_left.nil?

    root.connected_spaces << up_right unless up_right.nil?

    # down
    down_left = possible_moves([(start_space[0] - 1), (start_space[1] - 2)], visited) # left
    down_right = possible_moves([(start_space[0] + 1), (start_space[1] - 2)], visited) # right

    root.connected_spaces << down_left unless down_left.nil?

    root.connected_spaces << down_right unless down_right.nil?

    root
  end

  def knight_moves(starting_space, end_space, starting_node = possible_moves(starting_space), result = [], visited = [])
    return result if starting_space == end_space

    startin

  end
end

knight = Knight.new

p knight.possible_moves
