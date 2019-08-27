require "player.rb"

describe Player do
  describe "#move" do
    it "it receive the user´s inputs and restricts its inputs by the game rules" do
      board = (1..9).to_a
      player1 = Player.new("p1", "X")
      player2 = Player.new("p2", "O")
      player1.move(1, board)
      player2.move(4, board)
      player1.move(2, board)
      player2.move(5, board)
      expect(board).to eql(["X", "X", 3, "O", "O", 6, 7, 8, 9])
    end
  end
end