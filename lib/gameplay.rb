require 'pry'
require './lib/board'
require './lib/ship'

class Gameplay

def initialize
  @board = Board.new
end

  def start
    greeting = "Welcome to BATTLESHIP\n Enter p to play. Enter q to quit. "
    puts greeting
    user_input = gets.chomp
      if user_input == "p"
        setup
      elsif user_input == "q"
        puts "You suck for not playing"
      else
        puts "Please enter p or q"
        start
      end
  end

  def setup
    # cpu_sub_creation
  end

  def cpu_player_board
    p "It Works"
  end

  def cpu_sub_creation
    sub = Ship.new("Submarine", 2)
    random_coordinates_sub = @board.cells.keys.sample(2)
    if @board.validate_placement?(sub, random_coordinates_sub)
      p random_coordinates_sub
      cpu_player_board
    else
      cpu_sub_creation
    end
  end

  def cpu_cruiser_creation
    cruiser = Ship.new("Cruiser", 3)
    random_coordinates_cruiser = @board.cells.keys.sample(3)

    if @board.validate_placement?(cruiser, random_coordinates_cruiser)
      p random_coordinates_cruiser
      cpu_player_board
    else
      cpu_cruiser_creation
    end
  end

end
