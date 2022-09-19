# frozen_string_literal: true

require_relative 'board'
require_relative 'symbols'
require_relative 'player'

class ConnectFourGame
  include Symbols
  attr_accessor :board, :turn

  def initialize
    @board = Board.new
    @turn = 1
  end

  def play
    introduction
    create_player(red_circle)
    create_player(blue_cirlce)
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