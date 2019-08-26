# frozen_string_literal: true

class Player
  attr_reader :name, :mark
  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def move(board)
    print "Player '#{@name}' move: "
    move = gets.chomp.to_i
    while board[move - 1] != move
      puts 'That position is taken!'
      print 'Chose another position: '
      move = gets.chomp.to_i
    end
    board[move - 1] = @mark
  end
end
