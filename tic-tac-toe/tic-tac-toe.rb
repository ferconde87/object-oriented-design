class Board
  attr_accessor :size, :matrix
  
  def initialize(size = 3)
    @size = size
    @matrix = Array.new(size) { Array.new(size, STATE[:empty]) }
  end
end

STATE = {
  empty: 0,
  cross: 1,
  circle: -1
}

class Player
  attr_reader :kind
  def initialize(kind)
    @kind = kind
  end
end

class InvalidMoveError < StandardError
end

class Game
  attr_accessor :board, :player1, :player2, :cols , :rows, :diag, :rdiag
  attr_reader :size, :winner, :finished

  def initialize
    @board = Board.new
    @size = @board.size
    @rem_moves = @size * @size
    @player1 = Player.new(STATE[:cross])
    @player2 = Player.new(STATE[:circle])
    @cols = Array.new(@size) { { STATE[:cross] => 0, STATE[:circle] => 0 } }
    @rows = Array.new(@size) { { STATE[:cross] => 0, STATE[:circle] => 0 } }
    @diag = { STATE[:cross] => 0, STATE[:circle] => 0 }
    @rdiag = { STATE[:cross] => 0, STATE[:circle] => 0 }
  end

  def move(row, col, player)
    raise InvalidMoveError  if row < 0 || row >= @size || col < 0 || col >= @size
    raise InvalidMoveError if board.matrix[row][col] != STATE[:empty]
    board.matrix[row][col] = player.kind
    @cols[col][player.kind] += player.kind
    rows[row][player.kind] += player.kind
    diag[player.kind] += player.kind if is_diag?(row, col)
    rdiag[player.kind] += player.kind if is_rdiag?(row, col)
    if check_win?(player, row, col)
      @winner = player
      @finished = true
    end
    @rem_moves -= 1
    @finished = true if @rem_moves == 0
  end

  def is_diag?(row, col)
    row - col == 0
  end

  def is_rdiag?(row, col)
    @size - 1 == row + col
  end

  def draw?
    @finished && @winner.nil?
  end

  private

  def check_win?(player, row, col)
    return true if rows[row][player.kind].abs == size
    return true if cols[col][player.kind].abs == size
    return true if is_diag?(row, col) && diag[player.kind].abs == size
    return true if is_rdiag?(row, col) && rdiag[player.kind].abs == size
    false
  end
end
