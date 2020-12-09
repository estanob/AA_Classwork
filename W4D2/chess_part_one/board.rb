require_relative "piece.rb"
require_relative "nullpiece.rb"

class Board

  def initialize
    @board = Array.new(8) { Array.new(8) { Piece.new } }
    @board[2..5].each_with_index do |row, idx_1| 
      row.each_with_index do |el, idx_2|
        @board[idx_1 + 2][idx_2] = NullPiece.new
      end
    end
  end

  def move_piece(starting_pos, end_pos)
    if @board[starting_pos].is_a?(NullPiece)
      raise "There is no piece at this starting position"
    elsif !valid_move?
      raise "You cannot move to that end position" 
    else
      p "You have moved your piece from #{starting_pos} to #{end_pos}"
      # remove piece from starting_pos, add_pice to end_pos
      return true
    end
    
  end
end

b = Board.new
p b
# b.move_piece([1, 0], [2, 0])
# @board[[1, 0]]
