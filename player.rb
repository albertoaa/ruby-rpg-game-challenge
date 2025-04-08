class Player
  attr_accessor :name, :hp

  def initialize(name, hp = 20)
    @name = name
    @hp = hp
  end

  # roll_dice method simulates a dice roll
  def roll_dice
    rand(1..6)
  end

  # Attack method simulates an attack on the opponent
  # It rolls a dice for both players and calculates the damage
  # The damage is the difference between the attacker's roll and defender's roll
  # If the attacker's roll is less than the defender's roll, damage is 0
  # The opponent's HP is reduced by the damage
  def attack(opponent)
    attack_roll = roll_dice
    defense_roll = opponent.roll_dice
    damage = [attack_roll - defense_roll, 0].max

    opponent.hp -= damage
    puts "#{@name} attacks #{opponent.name} with #{attack_roll}. #{opponent.name} defends with #{defense_roll}."
    puts "#{opponent.name} takes #{damage} damage. #{opponent.name}'s HP: #{opponent.hp}"

    damage
  end

  # Check if the player is alive
  def alive?
    @hp > 0
  end
end