# Frozen_String_Literal: false

class Board

  def initialize
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

  # method that creates node for each space
end

class Node
  include Comparable
  attr_accessor :data, :left_u, :left_d, :right_u, :right_d, :up_l, :up_r, :down_l, :down_r

  def initialize(data)
    @data = data
    @left_u = nil
    @left_d = nil 
    @right_u = nil
    @right_d = nil
    @up_l = nil
    @up_r = nil
    @down_l = nil
    @down_r = nil
  end
end

# Class Knight
class Knight

  def initialize
  end

  def any_direction_match?(root)
    if root.left_u || root.left_d
      return true
    elsif root.right_u || root.right_d
      return true
    elsif root.down_l || root.down_r
      return true
    elsif root.up_l || root.up_r
      return true
    else
      return false
    end
  end

  def possible_moves(start_space, visited = [])
    return nil if Board.invalid?(start_space) || start_space.nil? || visited.length == 64

    if visited.none? { |element| element[0] == start_space }
      root = Node.new(start_space)
      visited << [start_space, root]
    else
      matching_roots_arr = visited.detect { |arr| arr[0] == start_space }
      root = matching_roots_arr[1]
    end
    return root if any_direction_match?(root)

    # left
    left_up = possible_moves([(start_space[0] - 2), (start_space[1] + 1)], visited) # up
    left_down = possible_moves([(start_space[0] - 2), (start_space[1] - 1)], visited) # down

    root.left_u = left_up unless left_up.nil?

    root.left_d = left_down unless left_down.nil?



    # right
    right_up = possible_moves([(start_space[0] + 2), (start_space[1] + 1)], visited) # up
    right_down = possible_moves([(start_space[0] + 2), (start_space[1] - 1)], visited) # down

    root.right_u = right_up unless right_up.nil?
    root.right_d = right_down unless right_down.nil?

    # up
    up_left = possible_moves([(start_space[0] - 1), (start_space[1] + 2)], visited) # left
    up_right = possible_moves([(start_space[0] + 1), (start_space[1] + 2)], visited) # right

    root.up_l = up_left unless up_left.nil?

    root.up_r = up_right unless up_right.nil?

    # down
    down_left = possible_moves([(start_space[0] - 1), (start_space[1] - 2)], visited) # left
    down_right = possible_moves([(start_space[0] + 1), (start_space[1] - 2)], visited) # right

    root.down_l = down_left unless down_left.nil?

    root.down_r = down_right unless down_right.nil?

    root
  end
end

knight = Knight.new

p knight.possible_moves([4, 4])

