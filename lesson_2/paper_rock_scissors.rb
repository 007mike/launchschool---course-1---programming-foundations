# paper_rock_scissors.rb

ACCEPTED_ANSWERS = %w(paper rock scissors)

def prompt(text)
  puts "=> #{text}"
end

def win?(player1, player2)
  (player1 == 'paper' && player2 == 'rock') ||
    (player1 == 'rock' && player2 == 'scissors') ||
    (player1 == 'scissors' && player2 == 'paper')
end

def print_who_wins(human, computer)
  if win?(human, computer)
    prompt('Congratulations, you won!')
  elsif win?(computer, human)
    prompt('Sorry, computer wins!')
  else
    prompt('The game was a draw!')
  end
end

prompt('---Paper Rock Scissors--v1--')

loop do
  human_choice = ''

  loop do
    prompt("Please choose one of the following: #{ACCEPTED_ANSWERS.join(' ,')}")
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
