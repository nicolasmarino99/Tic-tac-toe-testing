# frozen_string_literal: true

require 'player.rb'

describe Player do
  describe '#move' do
    let(:board) { Array.new(9, nil) }
    let(:player1) { described_class.new('p1', 'X') }
    let(:player2) { described_class.new('p2', 'O') }

    it 'updates the board with the move of one player' do
      player1.move(7, board)
      expect(board).to eql([nil, nil, nil, nil, nil, nil, 'X', nil, nil])
    end
    
    it 'updates the board with multiple moves from two players' do
      board = Array.new(9, nil)
      player1.move(1, board)
      player2.move(4, board)
      expect(board).to eql(['X', nil, nil, 'O', nil, nil, nil, nil, nil])
    end

    it 'returns false if the input is out of boundaries' do
      expect(player1.move(100, board)).to be(false)
    end
  end
end
