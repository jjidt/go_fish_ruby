require 'card'
require 'pry'

class Deck
  def initialize
    cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    suits = ["H", "D", "S", "C"]
    @deck = cards.product(suits).map {|x| Card.new(x)}.shuffle
  end
  def deck
    @deck
  end
end
