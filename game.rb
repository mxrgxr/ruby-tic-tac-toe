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

  def start
    # handle player turns and switch players until game is over true
    until game_over?
      play_turn
      switch_player
    end
    display_final_result
  end

  private

  def play_turn
    # display board state
    @board.display
    # check if player is AI to determine which method to call for move
    if @current_player.is_ai
      @current_player.make_move(@board)
    else
      cell_id = get_player_input
      @current_player.make_move(@board, cell_id)
    end
    check_winner
  end

  def display_final_result
    @board.display
    display_winner
  end
end
