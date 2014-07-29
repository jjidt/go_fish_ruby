class Player
  def initialize(name)
    @name = name
    @hand = []
  end

  def name
    @name
  end

  def set_hand(hand)
    hand.each {|x| @hand << x}
  end

  def hand
    @hand
  end
end
