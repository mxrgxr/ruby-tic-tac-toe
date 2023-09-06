# frozen_string_literal: true

# Player symbol and handle user's move
class Player
  def initialize(symbol)
    # player id is X or O
    @symbol = symbol
  end

  def make_move(board, cell_id)
    # board update method called and passed in cell to fill with symbol
    board.update(cell_id, @symbol)
  end
end
