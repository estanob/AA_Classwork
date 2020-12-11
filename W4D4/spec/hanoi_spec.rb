=begin
- the player can only move one number at a time
- a larger number cannot move on top of a smaller number
  - cannot be in front of a smaller number
- all numbers in the inital array must be moved to a different array while sorted
  - do not use the built-in methods for sorting
=end

=begin
- after we gets.chomp
  - compare the input to the variable names of the stacks(first, second, third)
  - puts "pick a stack | 1, 2, or 3"
  - if input == 1,
    - input = first
  - elsif input == 2,
    - input = second
  - else
    - input = third
=end

=begin
- in the #valid_moves in #game
  - to_stack.unshift(from_stack.shift)
- if it isn't a valid move
  - then puts "Invalid move. Try again."
=end