CHOICES = {
  r: 'ROCK',
  p: 'PAPER',
  sc: 'SCISSORS',
  l: 'LIZARD',
  sp: 'SPOCK'
}

WINNING_PICK = {
  r: [:sc, :l],
  p: [:r, :sp],
  sc: [:p, :l],
  l: [:p, :sp],
  sp: [:r, :sc]
}

def my_choice
  gets.chomp.strip.to_sym
end

def comp_choice
  CHOICES.keys.sample
end

puts "Time to choose your weapon: "

CHOICES.each do |key, value|
  print key.to_s + " => " + value + "    "
end
puts ""

my_pick = my_choice

cpu_pick = comp_choice

puts "I'm typing this..."
puts my_pick
puts "This is what gets output."
puts WINNING_PICK[my_pick]
puts "That was my pick."
sleep(2)
puts "This will be the computer pick."
puts cpu_pick
puts WINNING_PICK[cpu_pick]
puts "That was cpu's pick."

loop do
  puts "Now let's see who won."
  puts "You picked #{my_pick} and cpu picked #{cpu_pick}."
  sleep(3)
  if WINNING_PICK[my_pick].include?(cpu_pick)
    puts "You won."
    break
  elsif WINNING_PICK[cpu_pick].include?(my_pick)
    puts "Cpu won."
    break
  else
    puts "You tied."
    break
  end
end

puts "Hopefully this worked."