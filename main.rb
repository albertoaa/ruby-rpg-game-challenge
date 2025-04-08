#import the Player class from player.rb
require_relative 'player' # This line imports the Player class from player.rb

# The game method initializes two players and simulates a turn-based attack game
# It randomly selects an attacker and a defender, and alternates turns until one player is defeated
# The game continues until one of the players' HP reaches 0 or below
# The game ends with a message indicating the winner

def game(player1_name = "Player 1", player2_name="Player 2")
  player1 = Player.new(player1_name)
  player2 = Player.new(player2_name)

  attacker = [player1, player2].sample # Randomly select the attacker
  defender = (attacker == player1) ? player2 : player1 # Assign the defender

  puts "#{attacker.name} attacks first!"
  puts "#{attacker.name} vs #{defender.name}!"

  turn = 1 # Initialize turn counter
  
  # Game loop it iterates until one player is defeated
  while attacker.alive? && defender.alive?
    puts "\n--- Turn #{turn} ---"
    attacker.attack(defender)
    
    if defender.alive?
      attacker, defender = defender, attacker # Swap roles
    else
      puts "\n#{attacker.name} wins!"
      break
    end
    
    puts "\nPress Enter to continue the game..."
    $stdin.gets # Wait for Enter key input. $stdin.gets reads from standard input.

    turn += 1
  end

  puts "\nGame Over!"
end

game("Alice", "Bob") # You can change the player names here