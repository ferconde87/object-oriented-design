# without the notion of a player the Deck class has more responsability

SUIT = {
  :club => 0,
  :diamong => 1,
  :heart => 2,
  :spade => 3
}

class Deck
  # cards; dealt or not
  # dealt_index; first card no dealt
  attr_accessor :cards, :remaining, :dealt_index

  def initialize(cards)
    @cards = cards
    @remaining = cards.size
    @dealt_index = 0
  end

  def deal_hand(number)
  end

  def deal_card
  end

  def shuffle
  end
end

class Card
  attr_accessor :suit, :value; :available

  def initialize(suit, value)
    @suit = suit
    @value = value
    @available = true
  end
end

#thinking in blackjack or pocker game style
class Hand
  attr_accessor :cards

  def initialize
    @cards = Array.new
  end

  def add_card(card)
    @cards.push(card)
  end

  def score
    score = 0
    for card in @cards
      score += card.value
    end
  end
end
