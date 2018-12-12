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

  # def validate_placement?(ship, coordinates)
  #   validation = Validation.new
  #   validation.validate_placement?(ship, coordinates)
  #
  #   if valid_coordinates?(coordinates) != true
  #     false
  #   elsif validation.validate_ship_length?(ship, coordinates) != true
  #     false
  #   elsif validation.validate_duplicate_coordinate?(ship, coordinates) != true
  #     false
  #   elsif !validation.vertical_validation? && validation.horizontal_validation?
  #     true
  #   elsif validation.vertical_validation? && !validation.horizontal_validation?
  #     true
  #   else
  #     false
  #   end
  # end

  def validate_placement?(ship, coordinates)
    if coordinates.uniq.length == ship.length
      # All valid && empty?
      if valid_horizontal?(coordinates)
        return true
      elsif valid_vertical?(coordinates)
        return true
      end
    end
    return false
  end

  def valid_horizontal?(coordinates)
    coordinates.each_cons(2) do |a, b|
      if b[1].to_i - a[1].to_i != 1
        return false
      end
    end
    coordinates.all? do |coordinate|
      coordinate[0] == coordinates.first[0]
    end
  end

  def valid_vertical?(coordinates)
    # binding.pry
    coordinates.each_cons(2) do |a, b|
      # binding.pry
      if b[0].ord - a[0].ord != 1
        return false
      end
    end
    coordinates.all? do |coordinate|
      coordinate[1] == coordinates.first[1]
    end
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
    p game_board
  end

  end
