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

  def self.create_board
    arr = []
    (1..8).each do |i|
      (1..8).each do |j|
        arr << [i, j]
      end
    end
    arr
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
  attr_accessor :root, :all_spaces

  def initialize
    @root = nil
    @all_spaces = nil
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

  def find_match(searched_array, array)
    searched_array.detect { |element| element.data == array}
  end

  def possible_moves(start_space)

    board_spaces = Board.create_board

    board_space_objs = []
    
    board_spaces.each { |space| board_space_objs << Node.new(space)}

    board_space_objs.each do |space_obj|
      space_obj.left_u = find_match(board_space_objs, [(space_obj.data[0] - 2), (space_obj.data[1] + 1)])
      space_obj.left_d = find_match(board_space_objs, [(space_obj.data[0] - 2), (space_obj.data[1] - 1)])

      space_obj.right_u = find_match(board_space_objs, [(space_obj.data[0] + 2), (space_obj.data[1] + 1)])
      space_obj.right_d = find_match(board_space_objs, [(space_obj.data[0] + 2), (space_obj.data[1] - 1)])

      space_obj.up_l = find_match(board_space_objs, [(space_obj.data[0] - 1), (space_obj.data[1] + 2)])
      space_obj.up_r = find_match(board_space_objs, [(space_obj.data[0] + 1), (space_obj.data[1] + 2)])

      space_obj.down_l = find_match(board_space_objs, [(space_obj.data[0] - 1), (space_obj.data[1] - 2)])
      space_obj.down_r = find_match(board_space_objs, [(space_obj.data[0] + 1), (space_obj.data[1] - 2)])
    end
    @all_spaces = board_space_objs
    @root = find_match(board_space_objs, start_space)
  end
end

knight = Knight.new

knight.possible_moves([4,4])

p knight.root

