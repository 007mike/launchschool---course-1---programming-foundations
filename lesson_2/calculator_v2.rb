# calculator_v2.rb

# ask user for 2 numbers
# ask user for operation
# calculate result
# print result to screen

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0
end

def operation_to_msg(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

puts '--C-A-L-C-U-L-A-T-O-R--v2'

prompt('What is your name?')
name = ''

loop do
  name = gets.chomp

  if name.empty?
    prompt('You don\'t have a name? Try again:')
  else
    break
  end
end

prompt("Hi, #{name}")

loop do
  
  number1 = ''

  loop do
    prompt('What is the first number:')
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt('Hmmm.. please input a number')
    end
  end

  number2 = ''

  loop do
    prompt('What is the second number:')
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt('Hmmm.. please input a number')
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    [1] Addition
    [2] Subtraction
    [3] Multiplication
    [4] Division
  MSG
  prompt(operator_prompt)

  operation = ''

  loop do
    operation = gets.chomp
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt('You must select 1, 2, 3 or 4')
    end
  end

  prompt("#{operation_to_msg(operation)} the two numbers now... please wait...")

  result =  case operation
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  prompt('Result => ' + result.to_s)

  prompt('Try again? Type [y] to try another calculation.')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using C-A-L-C-U-L-A-T-O-R--v2 #{name}. Good bye!")
