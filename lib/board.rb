# frozen_string_literal: true

require_relative 'symbols'

class Board
  include Symbols
  attr_accessor :grid

  def initialize
    @grid = Array.new(6) { Array.new(7) { empty_circle } }
  end

  def display_board(grid = @grid)
    grid.each do |row|
      puts row.each { |e| e }.join(" ")
    end
    puts "1 2 3 4 5 6 7"
  end

  def update_board(row, column, symbol)
    grid[row][column] = symbol
  end

  def game_over?(symbol)
    check_horizontal(symbol)
    check_vertical(symbol)
    check_diagonal_left(symbol)
    check_diagonal_right(symbol)
  end

  def check_horizontal(symbol)
    grid.each do |row|
      row.each_with_index do |e, i|
        return true if row[i] == symbol && row[i + 1] == symbol && row[i + 2] == symbol && row[i + 3] == symbol 
      end
    end
  end

  def check_diagonal_right(symbol)
    grid.each_with_index do |row, i|
      row.each_with_index do |_e, j|
        return true if grid[i][j] == symbol && grid[i + 1][j + 1] == symbol && grid[i + 2][j + 2] == symbol && grid[i + 3][j + 3] == symbol 
      end
    end
  end

  def check_diagonal_left(symbol)
    grid.each_with_index do |row, i|
      row.each_with_index do |_e, j|
        return true if 
        grid[i][j] == symbol && grid[i - 1][j - 1] == symbol &&
        grid[i - 2][j - 2] == symbol && grid[i - 3][j - 3] == symbol
      end
    end
  end

  def check_vertical(symbol)
    grid.transpose.each do |row|
      row.each_with_index do |e, i|
        return true if row[i] == symbol && row[i + 1] == symbol && row[i + 2] == symbol && row[i + 3] == symbol 
      end
    end
  end

end