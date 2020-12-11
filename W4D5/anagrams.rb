require "byebug"

def anagram?(str1, str2)
  # debugger
  
  anagrams = str1.permutation.to_a
  # shuffle = str1.split("").shuffle.join("")

  anagrams.map! do |el|
    el.join("")
  end

  anagrams << shuffle if !anagrams.include?(shuffle)
  anagrams.include?(str2)

  #how many possibilities a string has based on its length

end

p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true