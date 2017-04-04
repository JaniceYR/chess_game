require_relative 'piece'
require 'byebug'

class Board
  INITIAL_LINE = [:r, :n, :b, :k, :q, :b, :n, :r]

  attr_accessor :board

  def initialize
    @board = Array.new(8) {
      Array.new(8) {0}
    }
    make_starting_grid

  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def dup
  end

  def move_piece(color, from_pos, to_pos)
    if valid_from?(from_pos) && valid_to?(to_pos)
      # we don't know yet
      move_piece!(from_pos, to_pos)
    end
  end

  def move_piece!(from_pos, to_pos)
    self[to_pos] = self[from_pos].dup
    self[from_pos] = Piece.new
  end

  def valid_from?(pos)
    valid_pos?(pos) && !self[pos].nil?
  end

  def valid_to?(pos)
        # we need to chang this part
    valid_pos?(pos) && self[pos].nil?

  end


  def valid_pos?(pos)
    pos.all? do |ele|
      ele.between?(0,7)
    end
  end

  def in_bounds?(pos)
    valid_pos?(pos)
  end

  def checkmate?
  end


  protected
  def make_starting_grid
    0.upto(7) {|i| @board[0][i] = Piece.new(INITIAL_LINE[i]) }
    0.upto(7) {|i| @board[1][i] = Piece.new(:p) }
    2.upto(5) {|i| 0.upto(7) {|idx| @board[i][idx] = Piece.new } }
    0.upto(7) {|i| @board[6][i] = Piece.new(:p) }
    0.upto(7) {|i| @board[7][i] = Piece.new(INITIAL_LINE[i]) }
  end

  def find_king(color)
  end

end


if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.print_board_for_test
  puts "Enter from_pos: "
  from_pos = gets.chomp.split(",").map{|el| el.to_i}
  puts "Enter to_pos: "
  to_pos = gets.chomp.split(",").map{|el| el.to_i}
  color = "black"
  b.move_piece(color, from_pos, to_pos)
  b.print_board_for_test
end
