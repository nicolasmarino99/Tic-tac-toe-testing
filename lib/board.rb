# frozen_string_literal: true

require 'paint'

class Board
  attr_accessor :board
  attr_reader :winner
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = [1, 2, 3,
              4, 5, 6,
              7, 8, 9]
    @winner = ''
  end

  def print
    puts ''
    puts "             #{print_cell(@board[0])} | #{print_cell(@board[1])} | #{print_cell(@board[2])} "
    puts '            ---+---+---'
    puts "             #{print_cell(@board[3])} | #{print_cell(@board[4])} | #{print_cell(@board[5])} "
    puts '            ---+---+---'
    puts "             #{print_cell(@board[6])} | #{print_cell(@board[7])} | #{print_cell(@board[8])} "
    puts ''
  end

  def winner?
    return true if check_array?('rows')
    return true if check_array?('columns')

    diagonals = [
      [@board[0], @board[4], @board[8]],
      [@board[2], @board[4], @board[6]]
    ]
    diagonals.each do |diagonal|
      return true if check_consecutive?(diagonal)
    end

    false
  end

  def tie?
    @board.count('X') == 5
  end

  private

  def print_cell(value)
    if value == @player1.mark
      Paint[value, :blue, :bright]
    elsif value == @player2.mark
      Paint[value, :red, :bright]
    else
      Paint[value, :gray]
    end
  end

  def check_array?(orientation)
    3.times do |row|
      array = []
      3.times do |col|
        array << if orientation == 'columns'
                   @board[col * 3 + row]
                 else
                   @board[row * 3 + col]
                 end
      end
      return true if check_consecutive?(array)
    end
    false
  end

  def check_consecutive?(orientation)
    if orientation.all? { |cell| cell == @player1.mark }
      @winner = @player1.name
      return true
    elsif orientation.all? { |cell| cell == @player2.mark }
      @winner = @player2.name
      return true
    end
    false
  end
end
