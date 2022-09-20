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
    @grid[row][column] = symbol
  end

  def free_row(column)
    row = 0
    loop do 
      return row if row == 5 || @grid[row + 1][column] != empty_circle

    row += 1
    end
  end

  def full_column?(column)
    return true if grid[0][column] != empty_circle
  end

  def game_over?(symbol)
    return true if check_horizontal(symbol)
    return true if check_vertical(symbol)
    return true if check_diagonal_left(symbol)
    return true if check_diagonal_right(symbol)
  end

  def check_horizontal(symbol)
    result = false
    @grid.each do |row|
      row.each_with_index do |_e, i|
        if row[i] == symbol && row[i + 1] == symbol && row[i + 2] == symbol && row[i + 3] == symbol
          result = true
        end
      end
    end
    result
  end

  def check_diagonal_right(symbol)
    result = false
    @grid.each_with_index do |row, i|
      row.each_with_index do |_e, j|
        unless i > 2 || j > 3
          if grid[i][j] == symbol && grid[i + 1][j + 1] == symbol && grid[i + 2][j + 2] == symbol && grid[i + 3][j + 3] == symbol 
          result = true
          end
        end
      end
    end
    result
  end

  def check_diagonal_left(symbol)
    result = false
    @grid.each_with_index do |row, i|
      row.each_with_index do |_e, j|
        unless i < 2 
          if  grid[i][j] == symbol && grid[i - 1][j + 1] == symbol && grid[i - 2][j + 2] == symbol && grid[i - 3][j + 3] == symbol
          result = true
          end
        end
      end
    end
    result
  end

  def check_vertical(symbol)
    result = false
    reverse_grid = @grid.transpose
    reverse_grid.each do |row|
      row.each_with_index do |_e, i|
       if row[i] == symbol && row[i + 1] == symbol && row[i + 2] == symbol && row[i + 3] == symbol 
       result = true
       end
      end
    end
    result
  end

end