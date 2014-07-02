def factorial(number)
  return 1 if number == 0
  number * factorial (number -1)
end

puts factorial(10)

# call the factorial method --> pass it 5 --> know want 120 at the end - so can test. if you know what you are testing for it is easy. If you don't know, you shouldn't be coding.