require 'colorize'
require_relative 'cursor'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    system("clear")
    @board.grid.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        piece = @board[[row_idx, col_idx]]
        if @cursor.cursor_pos == [row_idx, col_idx]
          if @cursor.selected
            print piece.to_s.colorize(color: :white, background: :blue)
          else
            print piece.to_s.colorize :red
          end
        else
          print piece.to_s
        end
        print " "
      end
      print "\n"
    end
  end

  def get_valid_cursor_move
    render
    start_pos, end_pos = nil
    until @board.valid_move?(start_pos, end_pos)
      input = @cursor.get_input # nil or some position
      render
      if input
        if @cursor.selected
          start_pos = input
        else
          end_pos = input
        end
      end
    end
    [start_pos, end_pos]
  end


  def test_cursor
    render
    25.times do
      @cursor.get_input
      render
    end
  end


end
