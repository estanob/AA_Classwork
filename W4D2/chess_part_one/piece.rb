module Slidable
  def move_dirs
    # [0,4] => [4, 4]
    if self.is_a?(Rook)
      horizontal_dirs
    elsif self.is_a?(Bishop)
      diagonal_dirs
    elsif self.is_a?(Queen)
      horizontal_dirs + diagonal_dirs
    end
  end

  def horizontal_dirs(starting_pos)
    possible_moves = []
    (0..7).each do |row|
      possible_moves << [row, startisng_pos[1]] if row != starting_pos[0]
    end

    (0..7).each do |col|
      possible_moves << [starting_pos[0], col] if col != starting_pos[1]
    end

    # ((starting_pos[0] + 1)..7).each do |el|
    #   possible_moves << [el, starting_pos[1]]
    # end
    # until

    # end
  end

  def diagonal_dirs

  end

end

module Stepable
  
end


class Piece
  include Slidable # <= we have access to 
  
  attr_accessor :color, :board, :pos

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
    @board[pos] = self
  end

  def moves
    @moves = []
  end

  def valid_moves
    puts "These are your possible moves for this turn:"
    @moves
  end

end

class Rook < Piece
  attr_accessor :symbol
  
  # def initialize(color, board, pos)
  #   super(color, board, pos)
  #   @symbol = :R
  # end
end


