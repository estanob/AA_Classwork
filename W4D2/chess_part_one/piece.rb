module Slidable
  
  def horizontal_dirs
    possible_moves = []
    (0..7).each do |row|
      possible_moves << [row, self.pos[1]] if row != self.pos[0]
    end
    
    (0..7).each do |col|
      possible_moves << [self.pos[0], col] if col != self.pos[1]
    end
    
    possible_moves

  end

  def diagonal_dirs
    possible_moves = [] # [3,5] [+-1,+-1]
    (0..7).each do |i| #i   possible_moves << starting_posself.pos[0] + i starting_posself.pos[1] + i 
      row = self.pos[0]
      col = self.pos[1]
      # [2, 4] --> [3, 5]
        # 0 --> 2
        # 4 - 2 = 2 [0, 2]
        # 1 --> 4 - 1 = 3 [1, 3] starting_posself.pos[0]  +i +i    -i +i     +i -i    -i -i
        # 0 [, 0]
        possible_moves << [(row + i), (col + i)]
        possible_moves << [(row + i), (col - i)]
        possible_moves << [(row - i), (col - i)]
      possible_moves << [(row - i), (col + i)] # if 
      #possible_moves.select do |position| position[0] + i                position != self.pos
    end
    possible_moves.select do |move|
      move != self.pos && move[0] >= 0 && move[1] >= 0 && move[0] <= 7 && move[1] <= 7
    end
  end

  private
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

  def inspect
    "{#{@symbol} @ #{@pos}}"
  end

  def moves
    @moves = move_dirs
    @moves
  end

  def valid_moves
    puts "These are your possible moves for this turn:"
    @moves
  end

end

class Rook < Piece
  attr_accessor :symbol
  
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = :R
  end


end

class Bishop < Piece
  attr_accessor :symbol
  
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = :B
  end
end

class Queen < Piece
  attr_accessor :symbol
  
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = :Q
  end
end