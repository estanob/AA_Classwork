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
  
  def [](pos) # => [pos]
    row, col = pos[0], pos[1]
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos[0], pos[1]
    @board[row][col] = value
  end

  def valid_move?(starting_pos, end_pos)
    # [2, 3] => [5, 6] => false
    # [+3, +3] [+-2, +-1] OR [+-1, +-2]

    #for now can only move forward 1 space
    #[1,1] => [1, 2] => true
    end_pos[0] == starting_pos[0] + 1 
  end

  def move_piece(starting_pos, end_pos)
    if [starting_pos].is_a?(NullPiece)
    # if @board[starting_pos].is_a?(NullPiece)
      raise "There is no piece at this starting position"
    elsif !valid_move?(starting_pos, end_pos)
      raise "You cannot move to that end position" 
    else #valid move
      p "You have moved your piece from #{starting_pos} to #{end_pos}"
      # remove piece from starting_pos, add_pice to end_pos
      [end_pos] = [starting_pos]
      [starting_pos] = NullPiece.new
      # @board[end_pos] = @board[starting_pos]
      # @board[starting_pos] = NullPiece.new
      return true
    end
    
  end
end

b = Board.new
p b[[1,0]]
p b[[2,0]]
p "check if the move worked"
b.move_piece([1, 0], [2, 0])
p b[[1,0]]
p b[[2,0]]
# @board[[1, 0]]