require_relative "helper"

class Board
  attr_accessor :matrix, :size
  def initialize(size = 3)
    @size = size
    @matrix =  Array.new(size) { Array.new(size) { STATE[:empty] } }
  end

end
