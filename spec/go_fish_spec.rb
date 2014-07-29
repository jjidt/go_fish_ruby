require 'rspec'
require 'game'
require 'player'

describe 'Game' do
  it 'creates a game' do
    test_game = Game.new
    test_game.should be_an_instance_of Game
  end

  it 'creates a game with a deck' do
    test_game = Game.new
    test_game.deck.is_a?(Array).should eq true
  end

  it 'randomly orders 52 cards in the deck' do
    test_game = Game.new
    test_game.deck.length.should eq 52
  end

  it 'creates two players on initialize' do
    test_game = Game.new
    test_game.players[0].should be_an_instance_of Player
  end
end

describe 'Player' do
  it 'creates a player' do
    test_player = Player.new(1)
    test_player.should be_an_instance_of Player
  end

end
