
require_relative 'piece'

class King < Piece
  include Stepable
  attr_accessor :MOVE

  MOVE = [[-1, 1], [-1, 0], [0, 1], [0, -1],
           [-1, -1], [1, 1], [1, -1], [1, 0]]
  def mapping_pos
  end
end


class Knight < Piece
  include Stepable
  attr_accessor :MOVE

  MOVE = [[-1, 2], [1, 2], [-2, 1], [2, 1],
           [-2, -1], [2, -1], [-1, -2], [1, -2]]
end
