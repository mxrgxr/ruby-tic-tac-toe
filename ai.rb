# frozen_string_literal: true

# AI player logic to determine best move
module AI
  def self.make_move(board, symbol)
    # create array of available moves by iterating over cells that return valid move true
    available_moves = (1..9).select { |cell_id| board.valid_move?(cell_id - 1) }
    # select random move from array
    random_move = available_moves.sample
    # update board with AI choice
    board.update(random_move, symbol)
  end
end
