require_relative "card"
require_relative "helper"

class Deck
  attr_accessor :cards

  def initialize(cards)
    raise InvalidCardsError if cards.map { |card| card.class != Card }.any?
    @cards = cards
  end

  def shuffle
  end

  def show
  end
  
end
