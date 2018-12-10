require 'pry'

class Validation
  attr_reader :vertical_ordinals,
              :horizontal_ordinals,
              :tot_hor_diff,
              :tot_vert_diff



  def validate_placement(coordinates)
    coordinate_conversion(coordinates)
    vertical_validation
  end

  def validate_ship_length?(ship, coordinates)
    if ship.length != coordinates.length
      false
    else
      true
    end
  end

  def coordinate_conversion(coordinates)
    temp_coord = []

    coordinates.each do |coordinate|
      temp_coord << coordinate.split('').flatten
      temp_coord = temp_coord.flatten
    end
    coordinate_ordinal_conversion(temp_coord)
  end

  def coordinate_ordinal_conversion(coordinates)
    # numbers
    temp_vertical_coordinates = []
    @vertical_ordinals = []

    # letters
    temp_horizontal_coordinates = []
    @horizontal_ordinals = []

    temp_vertical_coordinates = coordinates.select{|x| coordinates.index(x) % 2 != 0}
    temp_horizontal_coordinates = coordinates.select{|x| coordinates.index(x) % 2 == 0}

    temp_vertical_coordinates.each do |coordinate|
      @vertical_ordinals << coordinate.to_i
    end

    temp_horizontal_coordinates.each do |coordinate|
      @horizontal_ordinals << coordinate.ord
    end
    ordinal_differences
  end

  def ordinal_differences
      @tot_vert_diff = 0
    if @vertical_ordinals.count % 2 == 0
      @tot_vert_diff = 0
    else
      @tot_vert_diff = @vertical_ordinals[0]
    end
    @vertical_ordinals.each do |ordinal|
      @tot_vert_diff = @tot_vert_diff.abs - ordinal.abs
      end
      @tot_vert_diff = @tot_vert_diff.abs



      @tot_hor_diff = 0
      if @horizontal_ordinals.count % 2 == 0
        @tot_hor_diff = 0
      else
        @tot_hor_diff = @horizontal_ordinals[0]
      end
      @horizontal_ordinals.each do |ordinal|
        @tot_hor_diff = @tot_hor_diff.abs - ordinal.abs
        end
        @tot_hor_diff = @tot_hor_diff.abs
  end

  def vertical_validation
    vert_uniq = []
      vert_uniq = @vertical_ordinals.uniq

    if vert_uniq.count == 1
      true
    else
      false
    end
  end

  def horizontal_validation

  end
end
