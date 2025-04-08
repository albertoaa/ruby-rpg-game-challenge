class Player
  attr_accessor :name, :hp

  def initialize(name, hp = 20)
    @name = name
    @hp = hp
  end

  def roll_dice
    rand(1..6)
  end

  def attack(opponent)
    attack_roll = roll_dice
    defense_roll = opponent.roll_dice
    damage = [attack_roll - defense_roll, 0].max

    opponent.hp -= damage
    puts "#{@name} attacks #{opponent.name} with #{attack_roll}. #{opponent.name} defends with #{defense_roll}."
    puts "#{opponent.name} takes #{damage} damage. #{opponent.name}'s HP: #{opponent.hp}"

    damage
  end

  def alive?
    @hp > 0
  end
end

def game(player1_name = "Player 1", player2_name="Player 2")
  player1 = Player.new(player1_name)
  player2 = Player.new(player2_name)

  attacker = [player1, player2].sample # Randomly select the attacker
  defender = (attacker == player1) ? player2 : player1 # Assign the defender

  puts "#{attacker.name} attacks first!"
  puts "#{attacker.name} vs #{defender.name}!"

  turn = 1 # Initialize turn counter
  
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

game("Alice", "Bob")