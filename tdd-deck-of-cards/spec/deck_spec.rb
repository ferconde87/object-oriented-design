require "deck"
require "card"

RSpec.describe Deck do
  context "when the deck is invalid" do
    let(:card1) { Card.new(SUIT[:diamonds], 3)}
    it "if any card isn't a Card instance an InvalidCardsError" do
      expect{ Deck.new([card1, "a_string"]) }.to raise_error InvalidCardsError
    end
  end
  
  context "when the deck is valid" do
    let(:card1) { Card.new(SUIT[:diamonds], 3)}
    let(:card2) { Card.new(SUIT[:hearts], 7)}
    let(:deck) { Deck.new([card1, card2]) }
    it "has cards" do
      expect(deck.cards).not_to be_nil
    end

    it "has at least one card" do
      expect(deck.cards.size).to be > 0
    end

    it "has cards of class Card" do
      for card in deck.cards do
        expect(card.class).to be(Card)
      end
    end
  end

end
