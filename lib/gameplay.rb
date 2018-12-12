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
    cpu_start
    player_start
  end

  def cpu_start
    cpu_sub_creation
    cpu_cruiser_creation
    cpu_render_board
    binding.pry
  end

  def player_start
    p "Please place your submarine.  ex. ('A1', 'A2')"
    p "Please input your first coordinate for your submarine."
    user_input_subcoord1 = gets.chomp
    p "Please input your second coordinate for your submarine."
    user_input_subcoord2 = gets.chomp


    user_sub = Ship.new("Submarine", 2)
    binding.pry
    if @board.validate_placement?(user_sub, ([user_input_subcoord1, user_input_subcoord2]))


    end

  end

  def cpu_render_board
    puts @board.render(true)   #be sure to take this out
  end

  def cpu_sub_creation
    sub = Ship.new("Submarine", 2)
    random_coordinates_sub = @board.cells.keys.sample(2)
    if @board.validate_placement?(sub, random_coordinates_sub)
      @board.place(sub, random_coordinates_sub)
    else
      cpu_sub_creation
    end
  end

  def cpu_cruiser_creation
    cruiser = Ship.new("Cruiser", 3)
    random_coordinates_cruiser = @board.cells.keys.sample(3)

    if @board.validate_placement?(cruiser, random_coordinates_cruiser)
      @board.place(cruiser, random_coordinates_cruiser)
    else
      cpu_cruiser_creation
    end
  end




end

game = Gameplay.new

game.start
