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

  describe "#to_s" do
    it "return string representing the board" do
      expect(subject.to_s).to eql(" \e[37m1\e[0m | \e[37m2\e[0m | \e[37m3\e[0m\n---+---+---\n \e[37m4\e[0m | \e[37m5\e[0m | \e[37m6\e[0m\n---+---+---\n \e[37m7\e[0m | \e[37m8\e[0m | \e[37m9\e[0m")
    end
  end

end