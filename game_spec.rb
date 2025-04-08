require 'rspec'
require_relative 'game' # This line imports the Game class from game.rb

describe Game do
  let(:game) {Game.new}

  describe 'play' do
    let(:player1) { Player.new("Alice", 20) }
    let(:player2) { Player.new("Bob", 20) }
  
    it 'returns the winner when one player\'s hp reaches 0' do
      allow(player1).to receive(:roll_dice).and_return(6)
      allow(player2).to receive(:roll_dice).and_return(1)
  
      winner = game.play(player1, player2)
  
      expect(winner).to eq(player1)
      expect(player2.alive?).to be false
    end
  
    it 'handles a game where the winner changes roles' do
      allow(player1).to receive(:roll_dice).and_return(6)
      allow(player2).to receive(:roll_dice).and_return(1)
      allow(player1).to receive(:roll_dice).and_return(1)
      allow(player2).to receive(:roll_dice).and_return(6)
      allow(player1).to receive(:roll_dice).and_return(6)
      allow(player2).to receive(:roll_dice).and_return(1)
  
      winner = game.play(player1, player2)
  
      expect(winner).to eq(player1)
      expect(player2.alive?).to be false
    end
  
    it 'handles a game where the defender wins' do
        allow(player2).to receive(:roll_dice).and_return(6)
        allow(player1).to receive(:roll_dice).and_return(1)
        allow(player2).to receive(:roll_dice).and_return(1)
        allow(player1).to receive(:roll_dice).and_return(6)
        allow(player2).to receive(:roll_dice).and_return(6)
        allow(player1).to receive(:roll_dice).and_return(1)
      
        winner = game.play(player1, player2)
        expect(winner).to eq(player2)
        expect(player1.alive?).to be false
    end
  
    it 'handles a game with many turns' do
      allow(player1).to receive(:roll_dice).and_return(3)
      allow(player2).to receive(:roll_dice).and_return(2)
      
      winner = game.play(player1, player2)
  
      expect(winner).to be_a(Player)
    end
  
    it 'handles a game where the players have different starting hp' do
      player1 = Player.new("Alice", 20)
      player2 = Player.new("Bob", 5)
  
      allow(player1).to receive(:roll_dice).and_return(6)
      allow(player2).to receive(:roll_dice).and_return(1)
      
      winner = game.play(player1, player2)
      expect(winner).to eq(player1)
    end
  end
end