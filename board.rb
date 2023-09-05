# frozen_string_literal: true

# Initialize, render, update board
class Board
  def initialize
    # inital board has 2D array with 3 "rows" each containing 3 cells of empty string
    @board = Array.new(3) { Array.new(3, ' ') }
  end
end
