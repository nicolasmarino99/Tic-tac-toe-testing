# frozen_string_literal: true

require 'paint'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9, nil)
  end

  def winner?(mark)
    win_combinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    win_combinations.each do |combination|
      return true if combination.all? { |cell| @board[cell] == mark }
    end
    false
  end

  def to_s
    @board.each_slice(3).with_index.map do |row, i|
      " #{row.map.with_index(i * 3 + 1) { |v, i| print_cell(v || i) }.join(' | ')}"
    end.join("\n---+---+---\n")
  end

  private

  def print_cell(value)
    if value.is_a? Integer
      Paint[value, :gray]
    else
      Paint[value, :blue, :bright]
    end
  end
end
