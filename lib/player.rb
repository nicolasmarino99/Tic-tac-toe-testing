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
    position = gets.chomp.to_i
    until position.between?(1, 9)
      puts 'That not a valid position!'
      print 'Chose another position: '
      position = gets.chomp.to_i
    end
    while board[position - 1]
      puts 'That position is taken!'
      print 'Chose another position: '
      position = gets.chomp.to_i
    end
    position
  end
end
