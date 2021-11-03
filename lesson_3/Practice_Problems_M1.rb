#1

# My incorrect solution: 10.times{ |number| puts " " * number += 1 "The Flintstones Rock!" }
10.times{ |number| puts (" " * number) + "The Flintstones Rock!" }

#2

# (40 + 2) Both numbers are still integers. They need to be converted to a string.

puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

#3

def factors(number)
  divisor = number
  factors = []
 while
    number > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

#Bonus 1

# A factor is a number that can be divided into a number with no remainder.

#Bonus 2

# We need to return the method so the value is not nil.

#4

# Method 1 mutates the "buffer" argument, whereas method 2 does not mutate the similar "input_array" argument.

#5

# The limit variable is outside the scope of the method. Either make limit an argument or set the limit within the method.

#6

# The answer is 34. The method cannot see the variable "answer." When the method is called and "answer"
# is passed in as a variable, it is not the same variable as the first "answer." So when the final line
# is executed, the "answer" used is the variable, 42.

#7

# Because the method is using the actual "munsters" hash, it is messing with the hash.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

p munsters

#8

# ((paper, rock), rock)
# (paper, rock)
# paper
# Paper is the result.

#9

# foo = "yes"
# bar = If param == "no", then "yes", else "no"
# bar(foo) = "no" because "yes" != "no"