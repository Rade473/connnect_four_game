# frozen_string_literal: true

class Player
  attr_accessor :name, :symbol

  def initialize(symbol)
    @symbol = symbol
    puts "Please enter the name for player - #{symbol}"
    @name = gets.chomp
  end
end