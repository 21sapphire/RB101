CHOICE = {
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

MOTIVATION = [
  "Take a deep breath. Time for the next round!",
  "How are you feeling? It doesn't matter, the next round starts now!",
  "This is fun right? Let's keep it going!",
  "How does it feel to be participating in the best game of RPSLS ever??",
  "Spock, a lizard, and a rock walk into a bar...just kidding. Next round!",
  "That round was intense! Here comes another one!",
  "Can a human really beat a machine? We're about to find out?",
  "If you don't know who Spock is, Google him. But after this next round."
]

INSTRUCTIONS = [
  "Rock beats Scissors and Lizard.",
  "Paper beats Rock and Spock.",
  "Scissors beats Paper and Lizard.",
  "Lizard beats Paper and Rock.",
  "Spock beats Rock and Scissors."
]

WELCOME = [
  "Welcome to Rock-Paper-Scissors-Lizard-Spock!",
  "The rules are similar to Rock-Paper-Scissors. You have two extra weapons."
]

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

def thinking_medium
  sleep(2)
end

def thinking_short
  sleep(1)
end

def instructions
  loop do
    INSTRUCTIONS.each do |inst|
      puts inst.to_s
      thinking_medium
    end
    newline
    prompt("You will be playing against the computer. The first to 3 wins.")
    thinking_medium
    newline
    prompt("Are you ready to take on the machine?")
    thinking_short
    prompt("Press Y to continue or N to see the rules again.")
    answer = gets.chomp.downcase
    break unless answer.start_with?('n')
  end
end

def welcome
  loop do
    clear_screen
    WELCOME.each do |message|
      puts message.to_s
      thinking_long
      clear_screen
    end
    prompt("Do you need to see the rules? Press Y to continue or N to skip.")
    skip_rules = gets.chomp.downcase
    break if skip_rules.start_with?('n')
    clear_screen
    instructions
    break
  end
end

def prompt(message)
  puts message.to_s
end

def clear_screen
  system "clear"
end

def newline
  puts ""
end

def validate_answer(user_pick)
  CHOICE.keys.include?(user_pick)
end

def user_choice
  user_pick = ""
  loop do
    prompt("Choose your weapon: ")
    CHOICE.each do |abbreviation, full_name|
      print abbreviation.to_s + " => " + full_name.to_s + "    "
    end
    newline
    user_pick = gets.chomp.downcase.to_sym
    break if validate_answer(user_pick)
    prompt("You're better than that. Choose a valid weapon.")
  end
  user_pick
end

def machine_choice
  prompt("The machine is making its pick.")
  thinking_long
  newline
  CHOICE.keys.sample
end

# Game Code

clear_screen

welcome

prompt("Let's do this!")

thinking_medium

clear_screen

loop do
  user_score = 0
  machine_score = 0

  loop do
    prompt(" __________________________ ")
    prompt("|                          |")
    prompt("|    You: #{user_score}  Machine: #{machine_score}    |")
    prompt("|__________________________|")
    newline

    user_pick = user_choice
    newline
    machine_pick = machine_choice

    prompt("The machine has chosen: #{machine_pick}")
    thinking_short

    loop do
      clear_screen
      puts "Now let's see who won."
      thinking_medium
      clear_screen
      prompt("You picked: #{user_pick}.")
      prompt("The machine picked: #{machine_pick}.")
      sleep(3)
      clear_screen
      if WINNING_PICK[user_pick].include?(machine_pick)
        prompt("You won the round!")
        user_score += 1
      elsif WINNING_PICK[machine_pick].include?(user_pick)
        prompt("The machine won the round.")
        machine_score += 1
      else
        prompt("You tied. Try again.")
      end
      thinking_medium
      clear_screen
      break
    end

    newline

    if user_score == 3
      prompt("You defeated the Machine!!!")
      thinking_short
      prompt("!!!!!!!!!!!!!!!!!!")
      thinking_short
      prompt("!!!!!!!!!!!!!!!!!!")
      thinking_short
      clear_screen
      break
    elsif machine_score == 3
      prompt("The machines won again. Better luck next time.")
      break
    else
      thinking_short
      prompt("Your score is: #{user_score}")
      prompt("The machine's score is: #{machine_score}")
      thinking_medium
      newline
      if user_score < machine_score
        puts "Don't let the machine win!"
      elsif user_score > machine_score
        puts "Show no mercy!"
      else
        puts "You and the machine are tied."
      end
      newline
      prompt(MOTIVATION.sample)
      sleep(3)
      clear_screen
    end
  end
  prompt("Would you like to play again? Y or N")
  again = gets.chomp.downcase
  break unless again.start_with?("y")
end

prompt("Thank you for playing!")
