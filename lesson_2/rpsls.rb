# Hashes, Arrays, Messages

CHOICE = {
  '1' => 'ROCK',
  '2' => 'PAPER',
  '3' => 'SCISSORS',
  '4' => 'LIZARD',
  '5' => 'SPOCK'
}

WEAPONS = [:ROCK, :PAPER, :SCISSORS, :LIZARD, :SPOCK]

WINNING_PICK = {
  ROCK: [:SCISSORS, :LIZARD],
  PAPER: [:ROCK, :SPOCK],
  SCISSORS: [:PAPER, :LIZARD],
  LIZARD: [:PAPER, :SPOCK],
  SPOCK: [:ROCK, :SCISSORS]
}

INSTRUCTIONS = [
  ">> Rock beats Scissors and Lizard.",
  ">> Paper beats Rock and Spock.",
  ">> Scissors beats Paper and Lizard.",
  ">> Lizard beats Paper and Rock.",
  ">> Spock beats Rock and Scissors."
]

WELCOME = [
  "### Welcome to Rock-Paper-Scissors-Lizard-Spock! ###",
  "### It's just like Rock-Paper-Scissors except you have 5 choices. ###"
]

COMMENTS = {
  winning: [
    "You're doing great!",
    "You're not cheating, are you?",
    "Win this thing!"
  ],
  losing: [
    "That was a rough round.",
    "This isn't going well.",
    "The machine must be cheating."
  ],
  tie: [
    "Close game!",
    "Whose going to win?",
    "The is nerve-wrecking!"
  ]
}

# Some Functional Methods

def center(msg)
  msg.center(69)
end

def input_prompt
  1.times do
    print "\r>> "
    sleep(0.5)
    print "\r   "
    sleep(0.5)
  end
  print "\r>> "
end

def clear_screen
  system "clear"
end

def newline
  puts ""
end

def thinking_long
  count = 1
  loop do
    print "."
    sleep(1)
    if count == 3
      break
    else
      count += 1
    end
  end
end

# Intro to Game Play Methods

def show_instructions
  INSTRUCTIONS.each do |inst|
    puts center(inst.to_s)
    sleep(2)
  end
end

def show_welcome
  WELCOME.each do |message|
    puts center(message.to_s)
    thinking_long
    clear_screen
  end
end

def instruct
  loop do
    show_instructions
    puts center("You will play against the computer. The first to 3 wins.")
    sleep(2)
    newline
    puts center("Are you ready to take on the machine?")
    sleep(1)
    puts center("Press Y to continue or N to see the rules again.")
    input_prompt
    answer = gets.chomp.downcase
    break unless answer.start_with?('n')
  end
end

def welcome
  loop do
    clear_screen
    show_welcome
    puts center("Do you need to see the rules?")
    puts center("Press Y to continue or N to skip.")
    input_prompt
    skip_rules = gets.chomp.downcase
    break if skip_rules.start_with?('n')
    clear_screen
    instruct
    break
  end
end

# Game Play Methods

def key
  puts center("Choose your weapon")
  CHOICE.each do |num, full_name|
    print num.to_s + " => " + full_name.to_s + "    "
  end
  newline
end

def scoreboard(user_score, machine_score, round)
  puts center(" __________________________ ")
  puts center("|                          |")
  puts center("|    You: #{user_score}  Machine: #{machine_score}    |")
  puts center("|                          |")
  puts center("|         Round: #{round}         |")
  puts center("|__________________________|")
  newline
end

def round_score(user_pick, machine_pick)
  print 'Your'
  puts 'Computer'.rjust(65)
  print 'Pick'
  puts 'Machine'.rjust(65)
  puts "---------------------------------------------------------------------"
  print user_pick.to_s
  puts machine_pick.to_s.rjust(69 - user_pick.length)
  newline
end

def validate_answer(user_pick)
  WINNING_PICK.keys.include?(user_pick)
end

def user_choice
  user_num = ""
  user_pick = ""
  loop do
    input_prompt
    user_num = gets.chomp.to_i
    user_pick = WEAPONS[(user_num - 1)]
    break if validate_answer(user_pick)
    puts center("You're better than that. Choose a valid weapon.")
  end
  user_pick
end

def machine_choice
  newline
  WEAPONS.sample
end

# THIS IS THE GAME!

clear_screen

welcome
clear_screen
puts center("Let's do this!")

sleep(2)

clear_screen

loop do
  user_score = 0
  machine_score = 0
  round = 1
  user_pick = ""
  machine_pick = ""

  loop do
    scoreboard(user_score, machine_score, round)
    key
    user_pick = user_choice
    machine_pick = machine_choice
    round_score(user_pick, machine_pick)
    sleep(3)

    loop do
      if WINNING_PICK[user_pick].include?(machine_pick)
        puts center("You won the round!")
        newline
        puts center(COMMENTS[:winning].sample.to_s)
        user_score += 1
      elsif WINNING_PICK[machine_pick].include?(user_pick)
        puts center("The machine won the round.")
        newline
        puts center(COMMENTS[:losing].sample.to_s)
        machine_score += 1
      else
        puts center("You tied. Try again.")
        newline
        puts center(COMMENTS[:tie].sample.to_s)
      end
      sleep(2)
      clear_screen
      break
    end

    round += 1
    newline

    if user_score == 3
      puts center("You defeated the Machine!!!")
      sleep(3)
      clear_screen
      break
    elsif machine_score == 3
      puts center("The machines won again. Better luck next time.")
      sleep(3)
      break
    else
      sleep(2)
      clear_screen
    end
  end
  puts center("Would you like to play again? Y or N")
  input_prompt
  again = gets.chomp.downcase
  break unless again.start_with?("y")
end

puts center("Thank you for playing!")
sleep(3)
clear_screen
