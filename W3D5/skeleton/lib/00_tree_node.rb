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
        # a children: b, c, d
        # d, new parent: i, 
        # a chidren: b, c
        @parent.children.delete(self) #@parent d.parent = a.children [b, c, d] .delete(d) => a.children = [b, c]
        @parent = node
        node.children << self
      else
        @parent = node
        node.children << self
      end
    end
  end

  def remove_child(child)
    if !child.parent.nil?
      child.parent = nil
    else
      raise "this node is not a child"
    end
  end

  def add_child(child)
    child.parent = self
  end

  def dfs(target)
    return self if self.value == target #"a".dfs("d")
    self.children.each do |child| # ["b", "c"] "c" ["d", 'e']
      result = child.dfs(target) # "c".dfs("d") => "d".dfs("d") = "d" => c.dfs("d") = "d"
      return result unless result == nil #d 
    end
    nil
  end

  def bfs(target) 
    queue = [self] 
    until queue.empty? 
      removal = queue.shift 
      removal.children.each do |child| 
        queue.push(child)
      end 
      return removal if removal.value == target
    end
    nil
  end

  # def inspect
  #   "Tree node: #{object_id} - pos: #{value} - child: #{children}"
  # end

end