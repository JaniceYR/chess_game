require_relative 'board'
require_relative 'cursorable'
require 'colorize'
require_relative 'cursor.rb'
require 'byebug'

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    # while not Ctrl + C do render board
    while true
      space = @board.board
      space.each_with_index do |row, idx|
        row.each_with_index do |el, i|
          el_to_print = space[idx][i].to_s
          if @cursor.cursor_pos == [idx, i]
            print "#{el_to_print} ".colorize(:red)
          else
            print "#{el_to_print} "
          end
        end
        print "\n"
      end
      @cursor.get_input
      system("clear")
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.render
end