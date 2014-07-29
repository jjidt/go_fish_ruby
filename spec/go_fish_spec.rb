require 'rspec'
require 'game'
require 'player'
require 'card'
require 'deck'
require 'pry'

describe 'Game' do
  it 'creates a game' do
    test_game = Game.new(1,2)
    test_game.should be_an_instance_of Game
  end

  it 'creates a game with a deck' do
    test_game = Game.new(1,2)
    test_game.deck.is_a?(Array).should eq true
  end

  it 'creates two players on initialize' do
    test_game = Game.new(1,2)
    test_game.players[0].should be_an_instance_of Player
  end

  it 'deals a 7 card hand to each player' do
    test_game = Game.new(1,2)
    test_game.deal
    test_game.players[0].hand.length.should eq 7
  end

  it 'starts the game with player 1' do
    test_game = Game.new(1,2)
    test_game.turn.should eq 0
  end
end

describe 'Player' do
  it 'creates a player' do
    test_player = Player.new(1)
    test_player.should be_an_instance_of Player
  end

end

describe 'Card' do
  it 'creates a card' do
    test_card = Card.new(["A", "H"])
    test_card.should be_an_instance_of Card
  end

  it 'sets the card suit and value properties' do
    test_card = Card.new(["A", "S"])
    test_card.suit.should eq "S"
  end
end

describe 'Deck' do
  it 'creates the deck' do
    test_deck = Deck.new
    test_deck.deck.length.should eq 52
  end
end
