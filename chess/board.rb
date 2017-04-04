require_relative "piece"
require_relative "null_piece"
require_relative "queen"
require_relative "bishop"
require_relative "rook"
require_relative 'display'
require_relative 'king'

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
  board = Board.new
  display = Display.new(board)
  queen = Queen.new([2,3], board)
  rook = Rook.new([2,1], board)
  bishop = Bishop.new([2,2], board)
  king = King.new([4,2], board)
  display.render
  p king.moves
  # d.test_cursor

end
