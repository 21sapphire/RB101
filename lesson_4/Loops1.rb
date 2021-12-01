loop do
  puts 'Just keep printing...'
  break
end

# Rules:
# - make the loop stop after one iteration

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end
  break
end

puts 'This is outside all loops.'

# Rules:
# - make it so each loop stops after the first iteration

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# Explicit requirements:
# - modify the loop so it iterates 5 times instead of just once
# Implicit requirements:
# - use the iterations variable as a counter

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp.downcase
  break if answer == 'yes'
end

# Explicit requirements:
# - modify the code so the loop stops iterating when the user inputs 'yes'
# Implicit requirements:
# - require the user to input a string
# - continue looping if the user types anything but 'yes'
# - account for capitalized versions of 'yes', like 'YES' or 'Yes'

say_hello = true
count = 0

while say_hello
  puts 'Hello!'
  count += 1
  say_hello = false if count == 5
end

# Explicit requirements:
# - "Hello!" should be printed 5 times

numbers = []

while numbers.size < 5
  numbers << rand(100)
end

puts numbers

# Explicit requirements:
# - use a while loop
# - print 5 random numbers
# - numbers must be between 0 and 99
# Example output:
# 62
# 96
# 31
# 16
# 36

count = 1

until count == 11
  puts count
  count += 1
end

# Explicit requirements:
# - modify the code so that it counts from 1 to 10

numbers = [7, 9, 13, 25, 18]
count = 0

until count == numbers.size
  puts numbers[count]
  count += 1
end

# Explicit requirements:
# - use an until loop to print each number

for i in 1..100
  puts i if i % 2 != 0
end

# Explicit requirments:
# - only output i if i is an odd number

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for name in friends
  puts "Hello, #{name}!"
end

# Explicit requirements:
# - use a for loop
# - Expected Output: 
# Hello, Sarah!
# Hello, John!
# Hello, Hannah!
# Hello, Dave!