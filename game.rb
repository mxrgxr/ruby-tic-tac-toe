# frozen_string_literal: true

# Handle game flow from start, handle player input, check for winner, and display messages
class Game
  def initialize
    player_symbol = player_symbol_input
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

  def player_symbol_input
    # prompt for user input and validate that it is an X or O, format correctly and store in variable
    prints 'Enter symbol choice (X or O): '
    symbol = gets.chomp.upcase
    until %w[X O].include?(symbol)
      print 'Invalid choice. Enter symbol choice (X or O): '
      symbol = gets.chomp.upcase
    end
    symbol
  end

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

  def player_move_input
    # prompt user to make their move and validate input
    print 'Enter your move (1-9): '
    cell_id = gets.chomp.to_i
    until (1..9).include?(cell_id) && @board.valid_move?(cell_id - 1)
      print 'Invalid move. Enter your move (1-9): '
      cell_id = gets.chomp.to_i
    end
    cell_id
  end

  def display_final_result
    @board.display
    display_winner
  end
end
