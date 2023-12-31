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

  def cell_value(index)
    @board[index]
  end

  def valid_move?(cell_id)
    # check that index is within range and the value at index is empty
    @board[cell_id] == ' '
  end

  def update(cell_id, symbol)
    index = cell_id - 1
    # if valid move update cell value to symbol and return if successful boolean
    valid_move?(index) ? (@board[index] = symbol) : false
  end

  def full?
    # iterate over board array and check if any cells are empty
    @board.none? { |cell| cell == ' ' }
  end

  def reset
    initialize
  end
end
