#import the Player class from player.rb
require_relative 'player' # This line imports the Player class from player.rb
require_relative 'game'

# The game method initializes two players and simulates a turn-based attack game
# It randomly selects an attacker and a defender, and alternates turns until one player is defeated
# The game continues until one of the players' HP reaches 0 or below
# The game ends with a message indicating the winner

def main()
  game = Game.new(Player.new("Alice"), Player.new("Bob"))

  player1 = game.player1
  player2 = game.player2

  attacker = game.pick_initial_attacker # Randomly select the attacker
  defender = game.pick_initial_defender(attacker) # Assign the defender

  puts "#{attacker.name} attacks first!"
  puts "#{attacker.name} vs #{defender.name}!"

  turn = 1 # Initialize turn counter
  
  game.play(attacker, defender, true)

  puts "\nGame Over!"
end

main