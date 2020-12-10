def my_uniq(array)
  uniq_nums = []
  array.each do |num|
    uniq_nums << num if !uniq_nums.include?(num)
  end
  uniq_nums
end

class Array
  def two_sum
    pairs = []

    self.each_with_index do |el1, i|
      self.each_with_index do |el2, j|
        pairs << [i, j] if self[i] + self[j] == 0 && j > i
      end
    end

    pairs
  end
end

def my_transpose(matrix) # [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
  transposed = [] # [m[0,0], m[1, 0], m[2,0]]
  while transposed.length < matrix.length
    subs = []               # [1, 2]
    matrix.each do |subarray| # [0, 1, 2], [3, 4, 5], [6, 7, 8]
      subs << subarray.shift # 0 | 3 | 6
    end
    transposed << subs
  end
  transposed
end

# days:          0, 1, 2, 3, 4,  5,  6,  7
# stock prices: [3, 5, 7, 4, 12, 11, 14, 9]
# take the difference b/w two stock prices to get gain/loss 
  # from buying then selling
# return most profitable pair
#remember can't sell before buying 
# [14, 3] => [0, 6]

def stock_picker(array)
  best_days = []
  profit = 0

  array.each_with_index do |day1, i|
    array.each_with_index do |day2, j|
      if j > i && (day2 - day1) > profit
        profit = day2 - day1
        best_days = [i, j]
      end
    end
  end

  best_days
end