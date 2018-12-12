require 'pry'
require './lib/board'
require './lib/ship'

class Gameplay

def initialize
  @player_board = Board.new
  @cpu_board = Board.new
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

  end

  def player_start
    p "==========Player Board=========="
    player_sub_creation
    player_cruiser_creation
    player_render_board
    binding.pry
  end

  def player_sub_creation
    p "Please place your submarine.  ex. ('A1', 'A2')"
    p "Please input your first coordinate for your submarine."
    ui_sub_coord1 = gets.chomp
    p "Please input your second coordinate for your submarine."
    ui_sub_coord2 = gets.chomp

    ui_sub_coords = [ui_sub_coord1, ui_sub_coord2]


    user_sub = Ship.new("Submarine", 2)


    if @player_board.validate_placement?(user_sub, ui_sub_coords)
      @player_board.place(user_sub, ui_sub_coords)
    else
      p "Invalid coordinates.  Please enter valid coordinates."
      player_sub_creation
    end
  end



  def player_cruiser_creation
    p "Please place your cruiser.  ex. ('A1', 'A2', 'A3')"
    p "Please input your first coordinate for your cruiser."
    ui_cruiser_coord1 = gets.chomp
    p "Please input your second coordinate for your cruiser."
    ui_cruiser_coord2 = gets.chomp
    p "Please input your third coordinate for your cruiser."
    ui_cruiser_coord3 = gets.chomp

    ui_cruiser_coords = [ui_cruiser_coord1, ui_cruiser_coord2, ui_cruiser_coord3]


    user_cruiser = Ship.new("Cruiser", 3)


    if @player_board.validate_placement?(user_cruiser, ui_cruiser_coords)
      @player_board.place(user_cruiser, ui_cruiser_coords)
    else
      p "Invalid coordinates.  Please enter valid coordinates."
      player_cruiser_creation
    end
  end




  def player_render_board
    puts @player_board.render(true)
  end

  def cpu_render_board
    puts @cpu_board.render(true)   #be sure to take this out
  end



  def cpu_sub_creation
    sub = Ship.new("Submarine", 2)
    random_coordinates_sub = @cpu_board.cells.keys.sample(2)
    if @cpu_board.validate_placement?(sub, random_coordinates_sub)
      @cpu_board.place(sub, random_coordinates_sub)
    else
      cpu_sub_creation
    end
  end

  def cpu_cruiser_creation
    cruiser = Ship.new("Cruiser", 3)
    random_coordinates_cruiser = @cpu_board.cells.keys.sample(3)
    if @cpu_board.validate_placement?(cruiser, random_coordinates_cruiser)
      @cpu_board.place(cruiser, random_coordinates_cruiser)
    else
      cpu_cruiser_creation
    end
  end


end

game = Gameplay.new

game.start
