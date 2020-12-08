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
    return true if @board.over? && @board.winner != evaluator
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = [] 
    @board.rows.each_with_index do |row, idx_1|
      row.each_with_index do |space, idx_2|
        pair = [idx_1, idx_2]
        if @board.empty?(pair)
          @board[pair] = :x
          node = TicTacToeNode.new(@board.dup, :o, pair)
          children << node
        end
      end
    end
    children
  end
end
