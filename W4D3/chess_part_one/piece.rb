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

  def moves
    @moves = [] #literal moves
    (-2..2).each do |row|
      (-2..2).each do |col|
        @moves << [row, col] if row.abs != col.abs && [row, col] != [0,0]
      end
    end
    @moves.map do |el|
      [el[0] + self.pos[0], el[1] + self.pos[1]]
    end
    @moves
  end

  def move_diffs

  end
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

class Knight < Piece
  attr_accessor :symbol
  
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = :K
  end
end

class Queen < Piece
  attr_accessor :symbol
  
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = :Q
  end
end

class Pawn < Piece
  attr_accessor :symbol
  
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = :P
  end

  def moves
    @moves = []
    (1..forward_steps).each do |el|
      @moves << [@pos[0] + (el * forward_dir), @pos[1]]
    end
    @moves
  end

  private #can't call self
  def at_start_row?
    if @color == :w
      return @pos[0] == 1
    else
      return @pos[0] == 6
    end
    # if true, pawn can move 2 spaces
  end

  def forward_dir # return 1 or -1
    if @color == :w
      return 1
    else
      return -1
    end
  end

  def forward_steps
    if at_start_row?
      return 2
    else
      return 1
    end
  end

  def side_attacks #:w @ [3,4] look at: :b [4, 3] || [4, 5] then we can move :w to spot
    
  end
end