class HanoiTowers
  
  def initialize
    @stacks = [[1, 2, 3], [], []]
    first, second, third = @stacks[0], @stacks[1], @stacks[2]
  end

  def you_win?
    if first.empty? && (!second.empty? || !third.empty?)
      return true
    end
  end

  def game
    while !you_win?
      puts "Pick a stack to move from | 1, 2, or 3" 
      from_stack = gets.chomp.to_i
      if from_stack == 1,
        from_stack = first
      elsif from_stack == 2,
        from_stack = second
      else
        from_stack = third
      end

      puts "Pick a stack to move to | 1, 2, or 3" 
      to_stack = gets.chomp.to_i
      if to_stack == 1,
        to_stack = first
      elsif to_stack == 2,
        to_stack = second
      else
        to_stack = third
      end

      if valid_move?(from_stack, to_stack)
        
      end
    end
  end

  def move(from_stack, to_stack) #from [1, 2, 3]  | to []
    if to_stack == 1,
      first = to_stack
    elsif to_stack == 2,
      second = to_stack
    else
      third = to_stack
    end
    
    if from_stack == 1,
      first = from_stack
    elsif from_stack == 2,
      second = from_stack
    else
      third = from_stack
    end
    # shift from_stack and unshift to to_stack

    moving_piece = from_stack.shift
    to_stack.unshift(moving_piece) # from [2, 3] | to [1]

  end

  def valid_move?(from_stack, to_stack)
    return false if to_stack.first < from_stack.first
    return false if from_stack.empty?
    return true
  end

end