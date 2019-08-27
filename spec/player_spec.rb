require "player.rb"

describe Player do
  describe "#move" do
    it "it receive the user´s inputs and restricts its inputs by the game rules" do
      player_movements = Player.new("name", "X")
      expect(player_movements.move([1,2,3,4,5,6,7,8,9])).to eql(board[move - 1] = @mark)
    end

    


  end
end