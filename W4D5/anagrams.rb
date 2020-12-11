require "byebug"

def anagram?(str1, str2)
  # debugger
  
  anagrams = str1.split("").permutation.to_a  # n!

  anagrams.map! do |el|
    el.join("")
  end
  anagrams.include?(str2)

  #how many possibilities a string has based on its length

end

# Phase I: O(n!)


# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
  arr = str2.split("")
  str1.each_char.with_index do |char, i| #n
    if arr.include?(char)                #n
      # turn str2 into arr
      #iterate str1 w char & idx
      idx_char = arr.find_index(char) #maybe n
      arr[idx_char] = ""
    else
      return false
    end
  end
  final_str = arr.join("")
  return true if final_str == ""
end

#Phase II: O(n), O(n^2), O(n^3)???

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2)
  sort_1 = str1.chars.sort.join #o(1)
  sort_2 = str2.chars.sort.join       
  
  sort_1 == sort_2

end
# Phase III: O(n log n)


def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char { |char| hash1[char] += 1}
  str2.each_char { |char| hash2[char] += 1}

  hash1 == hash2
end
# Phase IV: O(n)


def bonus_anagram?(str1, str2)
  hash1 = Hash.new(0)

  str1.each_char { |char| hash1[char] += 1}     #n
  str2.each_char { |char| hash1[char] -= 1}     #n

  hash1.values.any? { |key| return false if key != 0 }  #n
  return true
end

#3n => O(n)



p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true
p bonus_anagram?("elvis", "livessssss") #=> false
p bonus_anagram?("el", "es") #=> false