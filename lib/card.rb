class Card
  def initialize(card)
    @suit = card[1]
    @value = card[0]
  end

  def suit
    @suit
  end

  def value
    @value
  end
end
