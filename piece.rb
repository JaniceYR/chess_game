require 'byebug'
class Piece
  attr_reader :name
  def initialize(name = nil)
    @name = name
  end

  def to_s
    if name
      "#{@name}"
    else
      "_"
    end
  end

  def nil?
    @name.nil?
  end

  def empty?
  end

  def symbol
  end

  def valid_moves
  end

  private
  def move_into_check(to_pos)
  end
end

module Slidable
  def moves(pos)
    # moving_dirs = self.class::MOVE
    # self.super.moves(moving_dirs)
    # self.class::MOVE.map do |p_pos|
    #   (0..1).each do |i|
    #     p_pos[i] + pos[i]
    #   end
    # end
  end

  private

  def move_dirs
  end

  def horizontial_dirs
  end

  def diagonal_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end

end


module Stepable
  def moves(pos)
    # moving_dirs = self.class::MOVE
    # self.super.moves(moving_dirs)
    mvs = []
    self.class::MOVE.map do |p_pos|
      mvs << [p_pos[0] + pos[0], p_pos[1] + pos[1]]
    end
    mvs
  end

  private

  def move_dirs

  end
end
