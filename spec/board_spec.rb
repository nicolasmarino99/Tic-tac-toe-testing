require "board.rb"

RSpec.describe Board do

  describe "#winner?" do
    it "returns false for a non winning board" do
      expect(subject.winner?("O")).to eql(false)
    end
    it "returns true for a winning row" do
      subject.board = ["O", "O", "O",
                     nil, nil, nil,
                     nil, nil, nil]
      expect(subject.winner?("O")).to eql(true)
    end
    it "returns true for a winning col" do
      subject.board = [nil, "O", nil,
                     nil, "O", nil,
                     nil, "O", nil]
      expect(subject.winner?("O")).to eql(true)
    end
    it "returns true for a winning diagonal" do
      subject.board = ["O", nil, nil,
                     nil, "O", nil, 
                     nil, nil, "O"]
      expect(subject.winner?("O")).to eql(true)
    end
  end
  
  describe "#tie?" do
    it "returns false for a non tie" do
      expect(subject).not_to be_tie
    end
    it "returns false for a tie" do
      subject.board = ["O", "X", "O",
                    "X", "X", "O", 
                    "X", "O", "X"]
      expect(subject).to be_tie
    end
  end
end