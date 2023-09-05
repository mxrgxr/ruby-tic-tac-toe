# frozen_string_literal: true

# Initialize, render, update board
class Board
  def initialize
    # inital board has 2D array with 3 "rows" each containing 3 cells of empty string
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def display
    # iterate over board array with row indices to display lines
    @board.each_with_index do |row, index|
      puts row.join(' | ')
      # prevent line below last row
      puts '---------' unless index == @board.length - 1
    end
  end
end
