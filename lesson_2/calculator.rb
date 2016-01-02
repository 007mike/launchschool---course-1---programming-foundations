# calculator.rb

# ask user for 2 numbers
# ask user for operation
# calculate result
# print result to screen



puts '--C-A-L-C-U-L-A-T-O-R--'
puts 'What is the first number:'

number1 = gets.chomp

puts 'What is the second number:'

number2 = gets.chomp

puts 'What operation? [1]Add [2]Subtract [3]Multiply [4]Divide'

operation = gets.chomp

if operation == '1'
  result = number1.to_i + number2.to_i
  symbol = '+'
elsif operation == '2'
  result = number1.to_i - number2.to_i
  symbol = '-'
elsif operation == '3'
  result = number1.to_i * number2.to_i
  symbol = '*'
elsif operation == '4'
  result = number1.to_f / number2.to_f
  symbol = '/'
else
  puts 'Unrecognized operation. Can not calculate an answer.'
  exit
end

puts 'Result => ' + number1 + ' ' + symbol + ' ' + number2 + ' = ' + result.to_s
