require_relative 'player'

class Game
  #create accessor for players
  attr_accessor :player1, :player2, :turn

  def initialize(player1 = Player.new("Max"), player2 = Player.new("June"))
    @player1 = player1
    @player2 = player2
    @turn = 1
  end

  def pick_initial_attacker
    [@player1, @player2].sample
  end

  def pick_initial_defender(player)
    player == @player1 ? @player2 : @player1
  end

  def play(attacker, defender)
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
  
      @turn += 1
    end
  end


  # define attack functionality

  # define switching roles

  # define if player has won


end