# frozen_string_literal: true

require 'board.rb'

RSpec.describe Board do
  subject(:board) { described_class.new }

  describe '#winner?' do
    it 'returns false for a non winning board' do
      expect(board.winner?('O')).to be(false)
    end

    it 'returns true for a winning row' do
      board.board = ['O', 'O', 'O',
                     nil, nil, nil,
                     nil, nil, nil]
      expect(board.winner?('O')).to be(true)
    end

    it 'returns true for a winning col' do
      board.board = [nil, 'O', nil,
                     nil, 'O', nil,
                     nil, 'O', nil]
      expect(board.winner?('O')).to be(true)
    end

    it 'returns true for a winning diagonal' do
      board.board = ['O', nil, nil,
                     nil, 'O', nil,
                     nil, nil, 'O']
      expect(board.winner?('O')).to be(true)
    end
  end

  describe '#to_s' do
    it 'return string representing the board' do
      expected_string = " 1 | 2 | 3\n---+---+---\n 4 | 5 | 6\n---+---+---\n 7 | 8 | 9"
      expect(board.to_s).to eql(expected_string)
    end
  end
end
