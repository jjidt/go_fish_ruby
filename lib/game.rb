require 'player'
require 'deck'
require 'card'
require 'pry'

class Game
  def initialize(name1, name2)
    player1 = Player.new(name1)
    player2 = Player.new(name2)
    @players = [player1, player2]
    @deck = Deck.new
    @turn = 0
  end

  def deck
    @deck.deck
  end

  def players
    @players
  end

  def deal
    first_seven = @deck.deck.slice!(0..6)
    next_seven = @deck.deck.slice!(0..6)
    @players[0].set_hand(first_seven)
    @players[1].set_hand(next_seven)
  end

  def toggle_turn
    @turn ^= 1
  end

  def turn
    @turn
  end

  def go_fish(check_card)
    players[@turn ^ 1].hand.find_index {|card| check_card == card.value}
  end

  def check_hand(check_card)
    players[@turn ^ 1].hand.delete_if {|card| players[@turn].hand << card if card.value == check_card}

  end
end
