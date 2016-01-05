# mortgage_calculator.rb

def prompt(text)
  puts "=> #{text}"
end

def valid_amount?(number)
  number.to_f > 0
end

def valid_years?(number)
  (number.to_i.to_s == number) && (number.to_i > 0)
end

puts '---Mortgage Calculator v1---'

loop do
  loan_amount = '0'

  loop do
    prompt('Please enter the loan amount in dollars:')
    loan_amount = gets.chomp
    if valid_amount?(loan_amount)
      break
    else
      prompt('Hmm... that doesn\' appear to be valid. ')
    end
  end

  annual_interest_rate = '0'

  loop do
    prompt('Please enter the annual interest rate APR%:')
    annual_interest_rate = gets.chomp
    if valid_amount?(annual_interest_rate)
      break
    else
      prompt('The interest rate is not valid.')
    end
  end

  loan_duration_years = '0'

  loop do
    prompt('Please enter the loan duration in years:')
    loan_duration_years = gets.chomp
    if valid_years?(loan_duration_years)
      break
    else
      prompt('Please enter a valid loan duration.')
    end
  end

  monthly_interest_rate = (annual_interest_rate.to_f / 100) / 12
  loan_duration_months = loan_duration_years.to_i * 12

  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate *
                    (1 + monthly_interest_rate)**loan_duration_months) /
                    ((1 + monthly_interest_rate)**loan_duration_months - 1)

  puts "\n"
  prompt("Loan amount:\t\t $#{loan_amount}")
  prompt("Annual APR%:\t\t #{annual_interest_rate}%")
  prompt("Loan duration:\t #{loan_duration_years} year(s)")
  prompt("Monthly payment:\t $#{format('%.02f', monthly_payment)}")

  puts "\n"
  prompt("Try again? Type [y] to try another calculation.")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thanks for using ---Mortgage Calculator v1---. Good bye!')
