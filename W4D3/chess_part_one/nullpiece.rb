require "singleton"

class NullPiece
  include Singleton

  def initialize
  end

  def inspect
    "-" # "- @ [4,0]"
  end
end