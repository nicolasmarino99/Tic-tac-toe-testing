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

  describe '#get_position' do
    subject(:player) { described_class.new('p1', 'X') }
    let(:board) { Array.new(9, nil) }
    (1..9).each do |i|
      it "returns #{i} when the user input is #{i}" do
        allow(player).to receive(:gets).and_return(i)
        expect(player.get_position(board)).to be(i)
      end
    end
  end

  describe '#valid_position?' do
    subject(:player) { described_class.new('p1', 'X') }
    (1..9).each do |i|
      it "returns true for position #{i}" do
        expect(player.valid_position?(i)).to be(true)
      end
    end
    it 'returns false for a position out of boundaries' do
      expect(player.valid_position?(55)).to eql(false)
    end
    it 'returns false for an non numeric position' do
      expect(player.valid_position?('hello')).to eql(false)
    end
  end

  describe '#taken_position?' do
    subject(:player) { described_class.new('p1', 'X') }
    let(:board) { ['X', nil, 'O', nil, 'X', nil, nil, nil, 'O'] }
    it 'returns true is a given position is not taken' do
      expect(player.taken_position?(board, 2)).to eql(true)
    end
    it 'returns false is a given position is taken' do
      expect(player.taken_position?(board, 5)).to eql(false)
    end
  end
end
