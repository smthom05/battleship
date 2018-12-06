require './lib/cell'
require 'pry'

class Board
  attr_reader :cells, :horizontal_coordinates, :vertical_coordinates

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

      @horizontal_coordinates = []
      @vertical_coordinates = []
      @vertical_ordinals = []
      @horizontal_ordinals = []

  end



  def coordinate_conversion(coordinates)
        temp_coordinates = []
        coordinates.each do |coordinate|
          temp_coordinates << coordinate.split("")
          temp_coordinates = temp_coordinates.flatten
    end
    @vertical_coordinates = temp_coordinates.select{|x| temp_coordinates.index(x) % 2 == 0}
    @horizontal_coordinates = temp_coordinates.select{|x| temp_coordinates.index(x) % 2 != 0}
    coordinate_conversion_ordinal
  end

  def coordinate_conversion_ordinal
    @vertical_coordinates.each do |coordinate|
      @vertical_ordinals = @vertical_ordinals << coordinate.ord
      end
    @horizontal_coordinates.each do |coordinate|
      @horizontal_ordinals = @horizontal_ordinals << coordinate.to_i.ord
      end
      ordinal_difference
  end

  def ordinal_difference
    total_ordinal_difference = 0
    @vertical_ordinals.each do |ordinal|
      # binding.pry
      total_ordinal_difference = (total_ordinal_difference).abs - (ordinal).abs
      # binding.pry
    end
    total_ordinal_difference
  end


  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end



  def valid_placement?(ship, coordinates)
    valid_placement = true
    if ship.length != coordinates.length
        valid_placement = false
    # elsif
    #
    # end
  end
    return vvalid_placement
  end
end
