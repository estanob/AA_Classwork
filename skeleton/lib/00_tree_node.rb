class PolyTreeNode
  attr_reader :parent, :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if self.parent == nil
      self.parent = node.parent
      self.children << node.children
    end
  end
end