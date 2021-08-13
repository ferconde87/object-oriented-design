require_relative "helper"
require_relative "player"
require_relative "board"

class Game
  attr_accessor :player1, :player2, :board
  attr_reader :winner, :is_finished, :is_draw

  def initialize
    @player1 = Player.new(STATE[:cross])
    @player2 = Player.new(STATE[:circle])
    @board = Board.new
    @cols = Array.new(3) { { STATE[:cross] => 0, STATE[:circle] => 0 } }
    @rows = Array.new(3) { { STATE[:cross] => 0, STATE[:circle] => 0 } }
    @diag = { STATE[:cross] => 0, STATE[:circle] => 0 }
    @rdiag = { STATE[:cross] => 0, STATE[:circle] => 0 }
    @is_finished = false
    @rem_moves = @board.size * @board.size
    @draw = false
  end

  def move(row, col, player)
    #validations
    n = @board.size
    raise InvalidMoveError if row < 0 || row >= n || col < 0 || col >= n
    raise InvalidMoveError if @board.matrix[row][col] != STATE[:empty]

    make_move(row, col, player)
    
    if check_win?(row, col, player)
      @winner = player
      @is_finished = true
    end

    @rem_moves -= 1
    if @rem_moves == 0
      @is_draw = true
      @is_finished = true
    end
  end

  private

  def is_diag?(row, col)
    row - col == 0
  end

  def is_rdiag?(row, col)
    row + col == @board.size - 1
  end

  def make_move(row, col, player)
    @board.matrix[row][col] = player.kind
    @cols[col][player.kind] += 1
    @rows[row][player.kind] += 1
    @diag[player.kind] +=1 if is_diag?(row, col)
    @rdiag[player.kind] +=1 if is_rdiag?(row, col)    
  end

  def check_win?(row, col, player)
    n = board.size
    return true if @cols[col][player.kind] == n
    return true if @rows[row][player.kind] == n
    return true if is_diag?(row,col) && @diag[player.kind] == n
    return true if is_rdiag?(row,col) && @rdiag[player.kind] == n
    return false
  end
end


# 00 01 02
# 10 11 12
# 20 21 22

# diag =>  col - row == 0
# rdiag => col + row == n-1

# cols = []
# rows = []
# diag  {cross 0}
#       {circle 0}
# same rdiag

# cols => col1    
#       {cross 0}
#       {circle 0}

#       col2     
      
#       col3
