# paper_rock_scissors.rb

ACCEPTED_ANSWERS = %w(p r s l sp)
answers_long = {p: 'paper', r: 'rock', s: 'scissors', l: 'lizard', sp: 'spock'}

def prompt(text)
  puts "=> #{text}"
end

def win?(player1, player2)
  (player1 == 'p' && player2 == 'r') ||
  (player1 == 'p' && player2 == 'sp') ||
  (player1 == 'r' && player2 == 's') ||
  (player1 == 'r' && player2 == 'l') ||
  (player1 == 's' && player2 == 'p') ||
  (player1 == 's' && player2 == 'l') ||
  (player1 == 'l' && player2 == 'p') ||
  (player1 == 'l' && player2 == 'sp') ||
  (player1 == 'sp' && player2 == 'r') ||
  (player1 == 'sp' && player2 == 's')
end

def print_who_wins(human, computer)
  if win?(human, computer)
    prompt('Congratulations, you won that round!')
  elsif win?(computer, human)
    prompt('Sorry, computer won that round!')
  else
    prompt('This round was a draw!')
  end
end

def keep_score(player1, player2, scores)
  if win?(player1, player2)
    scores[:human] += 1
  elsif win?(player2, player1)
    scores[:computer] +=1
  end
end

def short_name_to_long(choice, name)
  if choice == 'p'
    name[:p]
  elsif choice == 'r'
    name[:r]
  elsif choice == 's'
    name[:s]
  elsif choice == 'l'
    name[:l]
  else choice == 'sp'
    name[:sp]
  end
end

prompt('---Paper Rock Scissors--v2-Bonus-')

loop do
  human_choice = ''
  score = {human: 0, computer: 0}

  loop do
    loop do
      prompt("Choose: [p]aper, [r]ock, [s]cissors, [l]izard, [sp]ock}")
      human_choice = gets.chomp.downcase

      if ACCEPTED_ANSWERS.include?(human_choice)
        break
      else
        prompt('Sorry, that is not an acceptable choice.')
      end
    end

    computer_choice = ACCEPTED_ANSWERS.sample

    current_human_choice = short_name_to_long(human_choice, answers_long)
    current_computer_choice = short_name_to_long(computer_choice, answers_long)

    prompt("You selected: #{current_human_choice.upcase}. Computer selected: #{current_computer_choice.upcase}")

    print_who_wins(human_choice, computer_choice)
    keep_score(human_choice, computer_choice, score)
    prompt("Current Score -> You: #{score[:human]} || Computer: #{score[:computer]}")
    
    if score[:human] == 5
      prompt("Game over. You have won!")
      break
    elsif score[:computer] == 5
      prompt("Game over. Computer wins!")
      break
    end
  end

  puts "\n"
  prompt('Try again? [y]es')
  continue_game = gets.chomp.downcase
  break unless continue_game == 'y'
end

prompt('Goodbye! Thanks for playing.')
