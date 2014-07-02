def palindrome?(word)

  return true if word.length <=1

  return false if word.slice!(0) == word.slice!(word.length -1)

  #first and last letter aren't equal to each other - bang - slicing off the front and the end to change the world

  palidrome?(word)

  end

  puts palindrome?("ABBA")
end



# Recurssion
#   you call the method again within itself
#   Breakout clause
#   Mutate after the breakout clause