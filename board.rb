# frozen_string_literal: true

# Initialize, render, update board
class Board
  def initialize
    # inital board has array with 9 cells
    @board = Array.new(9, ' ')
  end

  def display
    # Iterate over the board array and display lines
    @board.each_slice(3).with_index do |row, index|
      puts row.join(' | ')
      puts '---------' unless index == 2
    end
  end
end
