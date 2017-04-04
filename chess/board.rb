require_relative "piece"
require_relative "null_piece"
require_relative "queen"
require_relative 'display'

class Board
  attr_reader :grid
  def initialize
    np = NullPiece.instance
    @grid = Array.new(8) do
      Array.new(8) { np }
    end
    populate_new_grid
  end

  def populate_new_grid
    @grid.each_index do |row_index|
      if [0,1,6,7].include? row_index
        @grid[row_index].each_index do |col_index|
          @grid[row_index][col_index] = Piece.new([row_index, col_index], self)
        end
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    raise "No piece to move" if self[start_pos].is_a?(NullPiece)
    raise "Position already taken" unless self[end_pos].is_a?(NullPiece)

    piece = self[start_pos]
    self[start_pos] = self[end_pos]
    self[end_pos] = piece
  end

  def in_bounds?(pos)
    x, y = pos
    x >= 0 && x <= 7 && y >= 0 && y <= 7
  end


end


if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  q = Queen.new([1,3], b)
  p q.move_dirs
  # d.test_cursor

end
