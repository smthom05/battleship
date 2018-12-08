require 'pry'



class Validation
  attr_reader :vertical_ordinals,
              :horizontal_ordinals



  def valid_placement(coordinates)
    coordinate_conversion(coordinates)

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

    # Separate into vertical and horizontal arrays
    temp_vertical_coordinates = coordinates.select{|x| coordinates.index(x) % 2 == 0}
    temp_horizontal_coordinates = coordinates.select{|x| coordinates.index(x) % 2 != 0}

    temp_vertical_coordinates.each do |coordinate|
      @vertical_ordinals << coordinate.ord
    end

    temp_horizontal_coordinates.each do |coordinate|
      @horizontal_ordinals << coordinate.to_i
    end


  def vertical_ordinal_difference
      @total_vertical_ordinal_difference = 0
      if @vertical_ordinals.count % 2 == 0
        @total_vertical_ordinal_difference = 0
      else
        @total_vertical_ordinal_difference = @vertical_ordinals[0]
      end
    end


  def validate_ordinals
    if (@total_vertical_ordinal_difference == 1) && (@total_horizontal_ordinal_difference == 0 && (@horizontal_ordinals == @horizontal_ordinals_with_cons[0]))
       true
    elsif (@total_vertical_ordinal_difference == 0) && (@total_horizontal_ordinal_difference == 1 && (@horizontal_ordinals == @horizontal_ordinals_with_cons[0]))
       true
    else
       false
    end
  end
 end
end

#
# # validate = Validation.new
# validate.coordinate_conversion(["A1","A2","A3"])
