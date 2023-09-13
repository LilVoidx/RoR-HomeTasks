CHOICES = %w[rock paper scissors]


def computer_choice
  CHOICES.sample
end


def determine_winner(user_choice, computer_choice)
  if user_choice == computer_choice
    "It's a tie!"
  elsif (user_choice == "rock" && computer_choice == "scissors") ||
    (user_choice == "paper" && computer_choice == "rock") ||
    (user_choice == "scissors" && computer_choice == "paper")
    "You win!"
  else
    "Computer wins!"
  end
end


loop do
  puts "Rock, Paper, or Scissors? (Type 'quit' to end the game)"
  user_input = gets.chomp.downcase

  unless CHOICES.include?(user_input) || user_input == "quit"
    puts "Invalid choice. Please choose Rock, Paper, or Scissors."
    next
  end

  if user_input == "quit"
    puts "Thanks for playing!"
    break
  end

  computer = computer_choice
  puts "Computer chose #{computer}"

  result = determine_winner(user_input, computer)
  puts result
end