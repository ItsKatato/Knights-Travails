# Frozen_String_Literal: false

class Board
  def initialize; end

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
  attr_accessor :data, :previous, :next_spaces, :visited

  def initialize(data)
    @data = data
    @previous = nil
    @next_spaces = []
    @visited = false
  end
end

# Class Knight
class Knight
  attr_accessor :all_spaces, :root

  def initialize
    @all_spaces = possible_moves
    @root = nil
  end

  def find_match(searched_array, array)
    searched_array.detect { |element| element.data == array }
  end

  def possible_moves
    board_spaces = Board.create_board

    board_space_objs = []

    board_spaces.each { |space| board_space_objs << Node.new(space) }

    board_space_objs.each do |space_obj|
      space_obj.next_spaces.push(find_match(board_space_objs, [(space_obj.data[0] - 2), (space_obj.data[1] + 1)]))
      space_obj.next_spaces.push(find_match(board_space_objs, [(space_obj.data[0] - 2), (space_obj.data[1] - 1)]))

      space_obj.next_spaces.push(find_match(board_space_objs, [(space_obj.data[0] + 2), (space_obj.data[1] + 1)]))
      space_obj.next_spaces.push(find_match(board_space_objs, [(space_obj.data[0] + 2), (space_obj.data[1] - 1)]))

      space_obj.next_spaces.push(find_match(board_space_objs, [(space_obj.data[0] - 1), (space_obj.data[1] + 2)]))
      space_obj.next_spaces.push(find_match(board_space_objs, [(space_obj.data[0] + 1), (space_obj.data[1] + 2)]))

      space_obj.next_spaces.push(find_match(board_space_objs, [(space_obj.data[0] - 1), (space_obj.data[1] - 2)]))
      space_obj.next_spaces.push(find_match(board_space_objs, [(space_obj.data[0] + 1), (space_obj.data[1] - 2)]))

      space_obj.next_spaces.compact!
    end
    @all_spaces = board_space_objs
  end

  def knight_moves(start_space, end_space)
    queue = []
    start_match = find_match(all_spaces, start_space)
    start_match.visited = true
    queue << start_match

    while !queue.empty?
      current_node = queue.shift
      current_node.next_spaces.each do |node|
        if !node.visited
          node.visited = true
          queue.push(node)
          node.previous = current_node
          if node.data == end_space
            print_path(end_space)
            queue.clear
            break
          end
        end
      end
    end
  end

  def print_path(end_space)
    node = find_match(all_spaces, end_space)
    route = []
    while !node.nil?
      route << node.data
      node = node.previous
    end
    route.reverse!
    puts "You made it in #{route.length - 1} moves! Here's your path:"
    p route
  end
end


knight = Knight.new

knight.root = knight.find_match(knight.all_spaces, [4, 4])
knight.knight_moves([3, 3], [4,3])

