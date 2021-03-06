def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i().to_s() == num # better way to evaluate if it's a number
end

prompt(" Welcome to Calculator!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("Hmm...that doesn't look like a valid number
      ")
    end
  end

  number2 = ''

  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("Hmm...that doesn't look like a valid number")
    end
  end

  prompt("What operation would you like to perform? 1) add 2) subtract
  3) multiply 4) divide")
  operator = Kernel.gets().chomp()

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
