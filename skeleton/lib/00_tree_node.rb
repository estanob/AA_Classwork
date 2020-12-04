class PolyTreeNode
  attr_reader :parent, :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if node == nil
      @parent = node
    else
      if !@parent.nil?
        @parent.children.delete(self) 
        @parent = node
        node.children << self.value
      else
        @parent = node
        node.children << self.value
      end
    end

    # if node == nil
    #   self.parent = node
    # else
    #   if !self.parent.nil?
    #     self.parent.children.delete(self) 
    #     self.parent = node
    #     node.children << self.value
    #   else
    #     self.parent = node
    #     node.children << self.value
    #   end
    # end
  end
end