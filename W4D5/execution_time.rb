def my_min(arr)
  smallest = 0
  arr.each_with_index do |el1, i1|
    arr.each_with_index do |el2, i2|
      if el1 < el2 && el1 < smallest
        smallest = el1
      end
    end
  end
  smallest
end

#phase I: quadratic O(n^2)


def my_min_2(arr)
  smallest = 0
  arr.each_with_index do |el1, i1|
    if el1 < smallest
      smallest = el1
    end
  end
  smallest
end

# phase II: O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list)  # =>  -5


def largest_contiguous_subsum(arr)
  sums = nil
  subarrays = []
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|  #n^2
      if j > i 
        subarrays << arr[i..j] # <= iteration, n 
      end
    end
  end
  
  subarrays.each do |sub|
    if sums == nil || sub.sum > sums  #n^2
      sums = sub.sum
    end
  end

  sums
end
# n^2 + n^2

# Phase I: O(n^2) n^3


def largest_contiguous_subsum_2(arr)
  sums = nil
  check_sum = nil
  (0...arr.length - 1).each do |i|    #n
    if check_sum == nil
      check_sum = arr[i]
    elsif check_sum < arr[i]
      check_sum = arr[i]
    elsif check_sum < arr[i] + arr[i+1]
      check_sum = arr[i] + arr[i + 1]
    end
    if sums == nil || sums < check_sum
      sums = check_sum
    end 
  end

  sums
end
# Phase II: O(n)
list = [-5, -4, -7] # => -4
p largest_contiguous_subsum_2(list) # => 8

# possible sub-sums
[5]           # => 5
[5, 3]        # => 8 --> we want this one
[5, 3, -7]    # => 1
[3]           # => 3
[3, -7]       # => -4
[-7]          # => -7