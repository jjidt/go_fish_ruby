require 'rspec'
require 'game'

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
end
