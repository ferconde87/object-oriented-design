require "board"

RSpec.describe "Board" do
  context "when the board is initialize" do
    let(:board) { Board.new }
    it "has a matrix" do
      expect(board.matrix).not_to be_nil
    end

    it "has a size" do
      expect(board.size).not_to be_nil
      expect(board.size).to be > 0
    end

    it "has the number of columns are equal to the size" do
      expect(board.matrix[0].size).to eq(board.size)
    end

    it "has the number of rows are equal to the size" do
      expect(board.matrix.size).to eq(board.size)
    end
  end
end
