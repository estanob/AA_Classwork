require_relative "piece"
require_relative "nullpiece"
require "byebug"

class Board
  attr_accessor :board
  
  def initialize
    @board = Array.new(8) { Array.new(8) { NullPiece.instance } }
    # @board[2..5].each_with_index do |row, idx_1| 
    #   row.each_with_index do |el, idx_2|
    #     @board[idx_1 + 2][idx_2] = NullPiece.new
    #   end
    # end
  end
  
  def [](pos) # => [pos]
    row, col = pos[0], pos[1]
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos[0], pos[1]
    @board[row][col] = value
  end

# def [](pos)
#     row, col = pos
#     @grid[row][col]
# end

# def []=(pos, val)
#     row, col = pos
#     @grid[row][col] = val [[1,0]]
# end

  def valid_move?(starting_pos, end_pos)
    # [2, 3] => [5, 6] => false
    # [+3, +3] [+-2, +-1] OR [+-1, +-2]

    #for now can only move forward 1 space
    #[1,1] => [1, 2] => true
    end_pos[0] == starting_pos[0] + 1 
  end

  def move_piece(starting_pos, end_pos)
    if self[starting_pos].is_a?(NullPiece)
      raise "There is no piece at this starting position"
    elsif !valid_move?(starting_pos, end_pos)
      raise "You cannot move to that end position" 
    else #valid move
      p "You have moved your piece from #{starting_pos} to #{end_pos}"
      self[end_pos] = self[starting_pos]
      self[starting_pos] = NullPiece.new
      return true
    end
    
  end
end

b = Board.new
# p b[[1,0]]
# p b[[2,0]]
# p "check if the move worked"
# b.move_piece([2, 0], [2, 0])
# p b[[1,0]]
# p b[[2,0]]
# @board[[1, 0]]
new_rook = Rook.new(:w, b, [0,0])
p new_rook
new_bishop = Bishop.new(:w, b, [1, 2])
p "-----------------"

# p new_bishop.move_dirs(new_bishop.pos)
p new_bishop.pos
p "bishop new moves:"
p new_bishop.moves
new_queen = Queen.new(:b, b, [7, 3])
p "Queen new moves:"
p new_queen.moves
new_knight = Knight.new(:b, b, [4, 0])

p "Knight new moves:"
p new_knight.moves
p b
