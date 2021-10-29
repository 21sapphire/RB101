#1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.include?("Spot")
p ages.key?("Spot")

#2

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase

#3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge!(additional_ages)

#4

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?('Dino')

#5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#6

p flintstones << "Dino"

#7

p flintstones.push("Dino", "Hoppy")

#8

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!("house training your pet dinosaur.")

#9

statement = "The Flintstones Rock!"

p statement.count("t")

#10

title = "Flintstone Family Members"

p title.center(40)