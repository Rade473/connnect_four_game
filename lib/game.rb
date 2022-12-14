# frozen_string_literal: true

require_relative 'board'
require_relative 'symbols'
require_relative 'player'

class ConnectFourGame
  include Symbols
  attr_accessor :board, :turn, :player1, :player2

  def initialize
    @board = Board.new
    @turn = 0
    @player1 = nil
    @player2 = nil
  end

  def play
    introduction
    @player1 = create_player(red_circle)
    @player2 = create_player(blue_cirlce)
    loop do
      player = player_turn
      board.display_board
      column = player_input(player)
      board.update_board(board.free_row(column), column, player.symbol)
      break if board.game_over?(player.symbol) || draw?
    end
    board.display_board
    if board.game_over?(player1.symbol)
      puts "#{player1.symbol} #{player1.name} has won the game in #{@turn} turns"
    end
    if board.game_over?(player2.symbol)
      puts "#{player2.symbol} #{player1.name} has won the game in #{@turn} turns"
    end
    if draw?
      puts 'Game ended in a draw after 42 turns'
    end
  end

  def player_turn
    @turn += 1
    if turn.odd?
      player1
    else
      player2
    end
  end

  def draw?
    return true if @turn == 42
  end

  def player_input(player)
    loop do
    puts "#{player.symbol} #{player.name}"
    puts 'Please enter a number from 1-7 to place your chip'
    column = gets.chomp.to_i - 1
      
    return column if verify_input?(column)

    puts "Wrong input \n "
    end
  end

  def verify_input?(column)
    column.between?(0,6) && !board.full_column?(column)
  end


  def introduction
    puts <<~HEREDOC

    Welcome to Connect Four!

    Connect Four is a two-player connection board game, in which the players choose a color and then take turns dropping colored tokens into a seven-column, 
    six-row vertically suspended grid. The pieces fall straight down, occupying the lowest available space within the column. 
    The objective of the game is to be the first to form a horizontal, vertical, or diagonal line of four of one's own tokens.

    HEREDOC
  end

  def create_player(symbol)
    Player.new(symbol)
  end

end