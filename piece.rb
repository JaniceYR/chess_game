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

  def moves
  end

  private
  def move_into_check(to_pos)
  end
end

module Slidable
  def moves
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
  def moves
    self.class::MOVE
  end

  private

  def move_dirs

  end
end
