# 1

puts "Let's add two numbers together. What is the first number you'd like to add?"
int1 = gets.chomp.to_i
puts "What is the second number you'd like to add?"
int2 = gets.chomp.to_i

answer = int1 + int2

puts "The answer to this simple addition equation is #{answer}."

# 2

words = ["The", "Cubs", "are", "going", "to", "win", "today"]

puts words.join(" ")

words2 = ["A", "shorter", "sentence."]

def make_sentence(words2)
  sentence = ""
  words2.each do |string|
    sentence << string + " "
  end

  puts sentence
end

make_sentence(words2)

integers = [1, 2, 3, 4, 5]

def making_array(integers)
  new_array = []
  integers.each.with_index do |i, idx| 
  new_array << i if idx%2 == 0
  end
  
  p new_array
end

making_array(integers)