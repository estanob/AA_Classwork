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
  (0...arr.length - 1).each_with_index do |el, i|
    if (arr[i] + arr[i + 1] > sums) || sums == nil
      sums = arr[i] + arr[i + 1]
    end
  end
  sums
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

# possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7