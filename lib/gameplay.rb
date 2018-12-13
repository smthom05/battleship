require 'pry'
require './lib/board'
require './lib/ship'

class Gameplay

def initialize
  @player_board = Board.new
  @cpu_board = Board.new
end

  def start
    greeting = "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit. "
    puts greeting
    user_input = gets.chomp
      if user_input == "p"
        setup
      elsif user_input == "q"
        puts "ok you suck"
      else
        puts "Please enter p or q"
        start
      end
  end

  def setup
    cpu_start
    player_start
    turn
  end

  def cpu_start
    cpu_sub_creation
    cpu_cruiser_creation
  end

  def player_start
    system('clear')

    player_sub_creation
    player_cruiser_creation
    player_render_board
  end

  def turn
    cpu_render_board
    player_render_board
    cpu_turn
    player_turn
    turn_results
    turn
    # if end_game != false
    #   end_game
    # else
    #   turn
    # end

  end

  def player_sub_creation
    player_render_board
    puts "I have laid out my ships.  Ok, it's your turn."
    puts "Please place your submarine.  The submarine is two units long.  ex A1 A2"
    puts "Please input your submarines coordinates."

    ui_sub_coords = gets.chomp
    ui_sub_coords = ui_sub_coords.split
    user_sub = Ship.new("Submarine", 2)

    if @player_board.validate_placement?(user_sub, ui_sub_coords)
      @player_board.place(user_sub, ui_sub_coords)
      system('clear')
    else
      system('clear')
      puts "Invalid coordinates.  Please enter valid coordinates."
      player_sub_creation
    end
  end

  def player_cruiser_creation

    player_render_board
    puts "Submarine successfully placed."
    puts "Please place your cruiser.  The cruiser is three units long.  ex A1 A2 A3"
    puts "Please input your cruiser coordinates."
    ui_cruiser_coords = gets.chomp
    ui_cruiser_coords = ui_cruiser_coords.split

    user_cruiser = Ship.new("Cruiser", 3)

    if @player_board.validate_placement?(user_cruiser, ui_cruiser_coords)
      @player_board.place(user_cruiser, ui_cruiser_coords)
      system('clear')
    else
      system('clear')
      puts "Invalid coordinates.  Please enter valid coordinates."
      player_cruiser_creation
    end
  end

  def player_render_board
    puts "==========Player Board=========="
    puts @player_board.render(true)
  end

  def cpu_render_board
    puts "=========== CPU Board==========="
    puts @cpu_board.render()
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

  def cpu_turn
    @cpu_turn_results = ""

    cpu_target = @player_board.cells.keys.sample
      if !@player_board.cells[cpu_target].fired_upon?
        if @player_board.valid_coordinate?(cpu_target)
          result = @player_board.cells[cpu_target].fire_upon
        end
      else
        cpu_turn
    end

    if result == nil
      @cpu_turn_results = "My shot on #{cpu_target} was a miss."
    elsif result == 0
      @cpu_turn_results = "My shot on #{cpu_target} sunk a ship."
    elsif result != 0
      @cpu_turn_results = "My shot on #{cpu_target} was a hit."
    end
  end

  def player_turn

    @player_turn_results = ""

    puts "Please enter a coordinate to fire on"
    ui_target = gets.chomp
    if @cpu_board.valid_coordinate?(ui_target)
    if !@cpu_board.cells[ui_target].fired_upon?
      result = @cpu_board.cells[ui_target].fire_upon
      else
        puts "That was already fired upon, try again."
      end
    else
      puts "Please enter a valid coordinate"
      player_turn
    end

    if result == nil
      @player_turn_results = "Your shot on #{ui_target} was a miss."
    elsif result == true
      @player_turn_results = "Your shot on #{ui_target} sunk a ship."
    elsif result != 0
      @player_turn_results = "Your shot on #{ui_target} was a hit."
    end
  end

  def turn_results
    puts @cpu_turn_results
    puts @player_turn_results
  end

  # def end_game
  #   @cpu_sunken_cells = []
  #   @player_sunken_cells = []
  #
  #   @cpu_board.cells.each do |coordinate, cell|
  #     binding.pry
  #     if @cpu_board.cells[coordinate].ship.sunk?
  #       @cpu_sunken_cells << cell
  #     else
  #       @cpu_sunken_cells
  #     end
  #   end
  #
  #   @player_board.cells.each do |coordinate, cell|
  #     if cell.ship.sunk?
  #       @player_sunken_cells << cell
  #     else
  #       @player_sunken_cells
  #     end
  #   end
  #
  #   if @cpu_sunken_cells == 5
  #     puts "You Win!"
  #   elsif @player_sunken_cells == 5
  #     puts "I Win!"
  #   else
  #     false
  #   end
  # end
end
