require "game"

RSpec.describe Game do
  let(:game) { Game.new }

  context "when the game starts" do
    it "has 2 player" do
      expect(game.player1).not_to be_nil
      expect(game.player2).not_to be_nil
    end

    it "has a board" do
      expect(game.board).not_to be_nil
    end

    it "has a size of 3" do
      expect(game.board.size).to be(3)
    end
  end

  context "when the move is invalid" do
    let(:player1) { game.player1 }
    let(:player2) { game.player2 }
    
    it "raise 'InvalidMoveError' if the position is outside of the board" do
      expect{ game.move(-1,0,player1) }.to raise_error(InvalidMoveError)
      expect{ game.move(0,-1,player1) }.to raise_error(InvalidMoveError)
      expect{ game.move(0,4,player1) }.to raise_error(InvalidMoveError)
      expect{ game.move(4,0,player1) }.to raise_error(InvalidMoveError)
    end

    it "raise 'InvalidMoveError' if the position is not empty" do
      game.move(0,0,player1)
      expect{ game.move(0,0,player2) }.to raise_error(InvalidMoveError)
    end
  end

  context "when the move is valid" do
    let(:player1) { game.player1 }
    let(:player2) { game.player2 }
    
    context "when a player makes a row" do
        it "makes the player wins the game" do
        game.move(0,0,player1)
        game.move(1,0,player1)
        game.move(2,0,player1)
        expect(player1).to be(game.winner)
        expect(game.is_finished).to be(true)
      end
    end

    context "when a player makes a col" do
      it "makes the player wins the game" do
        game.move(1,0,player1)
        game.move(1,1,player1)
        game.move(1,2,player1)
        expect(player1).to be(game.winner)
        expect(game.is_finished).to be(true)
      end
    end

    context "when a player makes a diag" do
      it "makes the player wins the game" do
        game.move(0,0,player1)
        game.move(1,1,player1)
        game.move(2,2,player1)
        expect(player1).to be(game.winner)
        expect(game.is_finished).to be(true)
      end
    end

    context "when a player makes a inverted diag" do
      it "makes the player wins the game" do
        game.move(0,2,player1)
        game.move(1,1,player1)
        game.move(2,0,player1)
        expect(player1).to be(game.winner)
        expect(game.is_finished).to be(true)
      end
    end

    context "when no player wins the game" do
      it "finishes in draw after 9 moves" do
        game.move(0,0,player1)
        game.move(0,1,player2)
        game.move(0,2,player1)
        game.move(1,0,player2)
        game.move(1,1,player1)
        game.move(1,2,player2)
        game.move(2,0,player2)
        game.move(2,1,player1)
        game.move(2,2,player2)
        expect(game.winner).to be_nil
        expect(game.is_finished).to be(true)
        expect(game.is_draw).to be(true)
      end
    end
  end
end
