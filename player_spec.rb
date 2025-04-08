require 'rspec'
require_relative 'player' # This line imports the Player class from player.rb
# This is a test suite for the Player class
# It uses RSpec, a testing framework for Ruby
# The tests cover the Player class's methods and functionality

# This block defines the tests for the Player class
# It uses RSpec's describe method to group related tests

describe Player do
  let(:player1) { Player.new("Alice", 20) }
  let(:player2) { Player.new("Bob", 20) }

  describe '#initialize' do
    it 'sets the name and hp' do
      expect(player1.name).to eq("Alice")
      expect(player1.hp).to eq(20)
    end

    it 'sets default hp to 20 if not provided' do
      player = Player.new("Charlie")
      expect(player.hp).to eq(20)
    end
  end

  describe '#roll_dice' do
    it 'returns a number between 1 and 6' do
      100.times do
        result = player1.roll_dice
        expect(result).to be_between(1, 6).inclusive
      end
    end
  end

  describe '#attack' do
    it 'reduces opponent\'s hp' do
      allow(player1).to receive(:roll_dice).and_return(6)
      allow(player2).to receive(:roll_dice).and_return(1)

      damage = player1.attack(player2)

      expect(damage).to eq(5)
      expect(player2.hp).to eq(15)
    end

    it 'does not reduce opponent\'s hp below 0' do
      allow(player1).to receive(:roll_dice).and_return(1)
      allow(player2).to receive(:roll_dice).and_return(6)

      damage = player1.attack(player2)

      expect(damage).to eq(0)
      expect(player2.hp).to eq(20)
    end

    it 'returns the damage dealt' do
      allow(player1).to receive(:roll_dice).and_return(5)
      allow(player2).to receive(:roll_dice).and_return(2)

      damage = player1.attack(player2)
      expect(damage).to eq(3)
    end
  end

  describe '#alive?' do
    it 'returns true if hp is greater than 0' do
      expect(player1.alive?).to be true
    end

    it 'returns false if hp is 0' do
      player1.hp = 0
      expect(player1.alive?).to be false
    end
  end
end