count = 1

loop do
  if count % 2 == 0
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end
  count += 1
  break if count > 5
end

# Explicit requirements:
# - use a loop
# - prints numbers 1 - 5
# - also prints whether the number is even or odd
# Expected Output:
# 1 is odd!
# 2 is even!
# 3 is odd!
# 4 is even!
# 5 is odd!

loop do
  number = rand(100)
  puts number
  break if number >= 0 && number <= 10
end

# Explicit requirements:
# - the loop stops if the variable 'number' is equal to or between 0 and 10
#    - use (0..10)? No, this didn't work. A truthy statement worked instead.

process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed."
    break
  end
else
  puts "The loop wasn't processed."
end

# Explicit requirements:
# - write and if/else statement
# - it should execute one thing if it returns true and another thing if it returns false
#    - when true, execute a loops that iterates once and prints "The loop was processed."
#    - when false, just print "The loop wasn't processed!"

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  else
    puts "Wrong answer. Try again!"
  end
end

# Explicit requirements:
# - "That's correct!" is printed when the user's answer equals 4.
# - The loop also stops when the answer equals 4.
# - Print "Wrong answer. Try again!" if the user's answer doesn't equal 4.

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  
  numbers << input
  break if numbers.size == 5
end

puts numbers

# Explicit requirements:
# - user's input gets added to the numbers array
# - stop the loop when the array contains 5 numbers

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.size == 0
end


# Explicit requirments
# - use loop to remove and print each name
# - stop the loop once names doesn't contain any more elements
# - use loop, not while, until, etc.

5.times do |index|
  puts index
  break if index == 2
end

# modify the block so that it prints the current number
# stops iterating when the current number equals 2

number = 0

until number == 10
  number += 1
  next if number % 2 != 0
  puts number
end

# use next
# only print even numbers

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next if number_a < 5 && number_b < 5
  puts "5 was reached!"
  break
end

# use next to modify the code so that the loop iterates until either number_a or number_b equals 5
# print "5 was reached!" before breaking out of the loop

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings != 0
  greeting
  number_of_greetings -= 1
end

# use a while loop to print "Hello!" twice