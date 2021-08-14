require "card"
require "helper"

RSpec.describe Card do
  context "when the suit is valid" do
    context "when the value is valid" do
      let(:card) { Card.new(SUIT[:clubs],1) }
      
      it "has a suit" do
        expect(card.suit).not_to be_nil
      end
  
      it "has a positive value" do
        expect(card.value).not_to be_nil
        expect(card.value).to be > 0
      end

      it "show a string representation of the card" do
        expect(card.suit).to eq('Clubs')
        expect(card.value).to eq(1)
        expect(card.show).to eq("1 of Clubs")
      end
    end

    context "when the value is not valid" do
      context "when the value is zero" do
        let(:card) { Card.new(SUIT[:clubs], 0) }
  
        it "raise an InvalidCardError" do
          expect{ card }.to raise_error InvalidCardError
        end
      end
  
      context "when the value is negative" do
        let(:card) { Card.new(SUIT[:clubs], -1) }
  
        it "raise an InvalidCardError" do
          expect{ card }.to raise_error InvalidCardError
        end
      end
    end
  end

  context "when the suit is invalid" do
    let(:card) { Card.new(nil, -1) }

    it "raise an InvalidCardError" do
      expect { card }.to raise_error InvalidCardError
    end
  end
end
