#3

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!("important", "urgent")

puts advice

#5

p (10..100).cover?(42)

#6

famous_words = "seven years ago..."

famous_words.prepend("Four score and ")

p famous_words

famous_words = "seven years ago..."

p more_famous_words = "Four score and " + famous_words

#7

p ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]].flatten

#8

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

print flintstones.assoc("Barney")