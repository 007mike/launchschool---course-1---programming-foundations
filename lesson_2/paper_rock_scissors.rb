# paper_rock_scissors.rb

ACCEPTED_ANSWERS = ['paper', 'rock', 'scissors']

def prompt(text)
  puts "=> #{text}"
end

def print_who_wins(human, computer)
  if (human == 'paper' && computer == 'rock') ||
      (human == 'rock' && computer == 'scissors') ||
      (human == 'scissors' && computer == 'paper')
      prompt('Congratulations, you won!')
  elsif (human == 'paper' && computer == 'scissors') ||
      (human == 'rock' && computer == 'paper') ||
      (human == 'scissors' && computer == 'rock')
      prompt('Sorry, computer wins!')
  else
      prompt('The game was a draw!')
  end
end

prompt('---Paper Rock Scissors--v1--')

loop do
  human_choice = ''

  loop do
    prompt("Please choose one of the following: #{ACCEPTED_ANSWERS.join(" ,")}")
    human_choice = gets.chomp.downcase

    if ACCEPTED_ANSWERS.include?(human_choice)
      break
    else
      prompt('Sorry, that is not an acceptable choice.')
    end
  end

  computer_choice = ACCEPTED_ANSWERS.sample

  prompt("You selected: #{human_choice.upcase}. Computer selected: #{computer_choice.upcase}")

  print_who_wins(human_choice, computer_choice)

  puts "\n"
  prompt('Try again? [y]es')
  continue_game = gets.chomp.downcase
  break unless continue_game == 'y'
end

prompt('Goodbye! Thanks for playing.')
