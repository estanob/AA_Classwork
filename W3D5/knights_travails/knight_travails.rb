class KnightPathFinder
  
  def self.valid_moves(pos)
    @considered_positions = [pos]

  end

  def initialize(starting_pos)
    @root_node = PolyTreeNode.new(starting_pos)
  end

  def build_move_tree

  end

  def new_move_pos(pos)

  end

end