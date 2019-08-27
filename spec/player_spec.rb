require "player.rb"

describe Player do
  describe "#move" do
    let(:board) { Array.new(9, nil) }
    let(:player1) { Player.new("p1", "X") }
    let(:player2) { Player.new("p2", "O") }

    it "updates the board with the move of one player" do
      player1.move(7, board)
      expect(board).to eql([nil, nil, nil, nil, nil, nil, "X", nil, nil])
    end
    it "updates the board with multiple moves from two players" do
      board = Array.new(9, nil)
      player1.move(1, board)
      player2.move(4, board)
      player1.move(2, board)
      player2.move(5, board)
      expect(board).to eql(["X", "X", nil, "O", "O", nil, nil, nil, nil])
    end
    it "returns false if the input is out of boundaries" do
      expect(player1.move(100, board)).to eql(false)
    end
  end
end