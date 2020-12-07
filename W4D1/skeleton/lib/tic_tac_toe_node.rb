require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos

    #@children = []
    #@parent = nil
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    node.board.each do |space|
      if space.empty?
        node = TicTacToeNode.new(@board.dup, :o, @prev_move_pos)
        children << node
      end
    end
    # 9.times do 
    #   node = TicTacToeNode.new(@board.dup, :o, @prev_move_pos)
    #   children << node
    # end

    children
  end
end
