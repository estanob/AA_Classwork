require_relative "../skeleton/lib/00_tree_node" #./skeleton/lib/00_tree_node.rb
class KnightPathFinder
  
  def self.valid_moves(pos)
    @considered_positions = [pos]
    8_moves = [[-1, -2], [-2, -1], [-2, 1], [-1, 2], [1, 2], [1, -2], [2, -1], [2, 1]]
    8_moves.each do |move|
      move_pos = [move[0] + pos[0], move[1] + pos[1]]
      #[-1, -2] [0, 0] move[0] + pos[0]       move[1] + pos[1]
      if move_pos[0] >= 0 && move_pos[0] < 8 && move_pos[1] >= 0 && move_pos[1] < 8
        @considered_positions.push(move_pos)
      end
    end
  end

  def initialize(starting_pos)
    @starting_pos = starting_pos
    @root_node = PolyTreeNode.new(starting_pos)
    @board = Array.new(8) {Array.new(8)}
    #    0 1 2 3 4 5 6 7
    #  0 
    #  1
    #  2       M   M
    #  3     M       M
    #  4         K
    #  5     M       M
    #  6       M   M
    #  7
  end

  def build_move_tree

  end

  def new_move_positions(pos)
    if !@considered_positions.include?(pos)
      KnightPathFinder.valid_moves(pos)
      @considered_positions.push(pos)
    end
    pos
  end

end

p new_game = KnightPathFinder.new([0,0])