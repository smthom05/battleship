require './lib/cell'
require './lib/validation'
require 'pry'

class Board
  attr_reader :cells

  def initialize
    @cells =   {
        "A1" => Cell.new("A1"),
        "A2" => Cell.new("A2"),
        "A3" => Cell.new("A3"),
        "A4" => Cell.new("A4"),
        "B1" => Cell.new("B1"),
        "B2" => Cell.new("B2"),
        "B3" => Cell.new("B3"),
        "B4" => Cell.new("B4"),
        "C1" => Cell.new("C1"),
        "C2" => Cell.new("C2"),
        "C3" => Cell.new("C3"),
        "C4" => Cell.new("C4"),
        "D1" => Cell.new("D1"),
        "D2" => Cell.new("D2"),
        "D3" => Cell.new("D3"),
        "D4" => Cell.new("D4")
      }
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def valid_coordinate?(coordinate)
      @cells.has_key?(coordinate)
  end

  def valid_coordinates?(coordinates)
    valid_coordinates = []
    coordinates.each do |coordinate|
      if @cells.has_key?(coordinate)
        valid_coordinates << coordinate
      else
        valid_coordinates
      end
    end
    valid_coordinates.count == coordinates.count
  end

  def validate_cells_are_empty?(coordinates)
    coordinates.each do |coordinate|
      if @cells[coordinate].empty? != true
        return false
      end
    end
    return true
  end

  def validate_placement?(ship, coordinates)
    validation = Validation.new

    if validation.validate_ship_length?(ship, coordinates)
      if valid_coordinates?(coordinates) && validate_cells_are_empty?(coordinates)
        if validation.valid_horizontal?(coordinates)
        return true
      elsif validation.valid_vertical?(coordinates)
        return true
      end
    end
    return false
  end
    return false
  end

  def render(cell_alert = false)
    game_board = "  1 2 3 4 \n"
    i = 0

    4.times do
      game_board +=  @cells[cells.keys[i]].coordinate[0]
      4.times do
        game_board += ' ' + @cells[cells.keys[i]].render(cell_alert)
        i += 1
      end
      game_board += " \n"
    end
    game_board
  end

  end
