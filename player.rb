# frozen_string_literal: true

require_relative 'ai'
# Player symbol and handle user's move
class Player
  include AI

  def initialize(symbol, is_ai: false)
    # player id is X or O
    @symbol = symbol
    @is_ai = is_ai
  end

  def make_move(board, cell_id = nil)
    if @is_ai
      AI.make_move(board, @symbol)
    else
      # board update method called and passed in cell to fill with symbol
      board.update(cell_id, @symbol)
    end
  end
end
