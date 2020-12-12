

# start with i, j
# i + j == target
# if any pair == target return boolean

def bad_two_sum?(arr, target)

  (0...arr.length - 1).each do |i|
    (0...arr.length - 1).each do |j|
      return true if j > i && arr[i] + arr[j] == target
    end
  end
  false
end

#Time complexity: O(n^2)
#Space complexity: O(1)

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target)
  #make the target the pivot for splitting
  #eles less than and equal will go left
  #eles greater will go right
  #iterate through both arrays, if they sum up, return true, if nothing sums, returns false

  first = []
  second = []

  arr.each do |num|
    if num <= target
      first << num
    else
      second << num
    end
  end

  if !second.empty? && first.none? { |num| num < 0 }
    (0...first.length - 1).each do |i|
      (0...first.length - 1).each do |j|
        return true if j > i && first[i] + first[j] == target
      end
    end
  end
  false

end


arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false