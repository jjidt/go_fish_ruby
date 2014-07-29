class Player
  def initialize(name)
    @name = name
    @hand = []
  end

  def name
    @name
  end

  def set_hand(hands)
    hands.each {|x| @hand << x}
  end

  def hand
    @hand
  end
end
