# frozen_string_literal: true

# Handle game flow from start, handle player input, check for winner, and display messages
class Game
  def initialize
    player_symbol = get_player_symbol
    ai_symbol = player_symbol == 'X' ? 'O' : 'X'
    @player1 = Player.new(player_symbol)
    @player2 = Player.new(ai_symbol, is_ai: true)
    @board = Board.new
    @current_player = @player1
  end
end
