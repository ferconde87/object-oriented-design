require_relative "helper"

class Card
  attr_accessor :suit, :value

  def initialize(suit, value)
    raise InvalidCardError if value <= 0
    raise InvalidCardError if suit.nil?
    @suit = suit
    @value = value
  end

  def show
    "#{@value} of #{@suit}"
  end
end
