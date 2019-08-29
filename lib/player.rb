# frozen_string_literal: true

class Player
  attr_reader :name, :mark
  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def move(position, board)
    position.between?(1, 9) ? board[position - 1] = @mark : false
  end

  def get_position(board)
    print "Player '#{@name}' move: "
    position = gets.to_i
    unless valid_position?(position)
      puts 'That not a valid position!'
      print 'Chose another position: '
      position = gets.to_i
    end
    unless taken_position?(board, position)
      puts 'That position is taken!'
      print 'Chose another position: '
      position = gets.to_i
    end
    position
  end

  def valid_position?(position)
    position.to_i.between?(1, 9)
  end

  def taken_position?(board, position)
    !board[position - 1]
  end
end
