def prompt(message)
  puts"=> #{message}"
end

loop do

  prompt("Thank you for using our Smart Mortgage home loan calculator. 
  This will help you know what your montly payment could be.")

  loan_amount = ' '

  loop do
    prompt("Enter your loan amount. Please type valid numbers only.")
    loan_amount = gets.chomp
    loan_amount = loan_amount.gsub(",","")
    if loan_amount.empty? || loan_amount.to_f < 0
      prompt("You must enter a positive number.")
    else
      break
    end
  end

  apr = ' '

  loop do
    prompt("What is your Annual Percentage Rate (APR)?")
    apr = gets.chomp
    if apr.empty? || apr.to_f < 0
      prompt("You must enter a positive number.")
    else
      break
    end
  end

  loan_years = ' '

  loop do
    prompt("What is the duration of your loan in years?")
    loan_years = gets.chomp
    if loan_years.empty? || loan_years.to_i < 0
      prompt("You must enter a positive number.")
    else
      break
    end
  end

  annual_int = (apr.to_f * 0.01)

  monthly_int = annual_int / 12

  loan_months = loan_years.to_i * 12

  monthly_payment = loan_amount.to_f * (monthly_int / (1 - (1 + monthly_int)**(-loan_months)))

  prompt("You're monthly payment is $#{monthly_payment.round(2)}.")

  prompt("Would you like to do another calculation? Press Y for Yes.")
  answer = gets.chomp

  break unless answer.downcase.start_with("y")
end

prompt("Thank you for using our calculator!")