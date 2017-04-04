require 'byebug'
module Slideable
  def moves(directions)
    moves = []
    if directions.include? :horizontal
      moves.concat(horizontal_dirs)
    end
    if directions.include? :diagonal
      moves.concat(diagonal_dirs)
    end
    moves
  end

  private
  def horizontal_dirs
    moves = []
    moves += grow_unblocked_moves_in_dir(1, 0)
    moves += grow_unblocked_moves_in_dir(0, 1)
    moves += grow_unblocked_moves_in_dir(-1, 0)
    moves += grow_unblocked_moves_in_dir(0, -1)
    moves
  end

  def diagonal_dirs
    moves = []
    # debugger
    moves += grow_unblocked_moves_in_dir(1, 1)

    moves += grow_unblocked_moves_in_dir(-1, -1)
    moves += grow_unblocked_moves_in_dir(-1, 1)
    moves += grow_unblocked_moves_in_dir(1, -1)
    moves
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    new_pos = [@position[0] + dx, @position[1] + dy]

    moves = []
    while @board.in_bounds?(new_pos) && @board[new_pos].empty?
      moves << new_pos
      new_pos = [new_pos[0] + dx, new_pos[1] + dy]
    end

    # debugger
    moves
  end
end
