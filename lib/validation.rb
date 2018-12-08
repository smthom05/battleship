require 'pry'

# class Validation
#
#   attr_reader :vertical_coordinates,
#               :horizontal_coordinates,
#               :vertical_ordinals,
#               :horizontal_ordinals,
#               :total_vertical_ordinal_difference,
#               :total_horizontal_ordinal_difference,
#               :horizontal_ordinals_with_cons
#
#
#   def initialize
#     @vertical_coordinates = []
#     @horizontal_coordinates = []
#     @vertical_ordinals = []
#     @horizontal_ordinals = []
#     @total_vertical_ordinal_difference = 0
#     @total_horizontal_ordinal_difference = 0
#     @horizontal_ordinals_with_cons = []
#   end
#
#
#   def validate(coordinates)
#     coordinate_conversion(coordinates)
#     coordinate_conversion_ordinal
#     vertical_ordinal_difference
#     horizontal_ordinal_difference
#     horizontal_ordinal_comparision
#     validate_ordinals
#   end
#
#   def validate_ordinals
#     if (@total_vertical_ordinal_difference == 1) && (@total_horizontal_ordinal_difference == 0 && (@horizontal_ordinals == @horizontal_ordinals_with_cons[0]))
#        true
#     elsif (@total_vertical_ordinal_difference == 0) && (@total_horizontal_ordinal_difference == 1 && (@horizontal_ordinals == @horizontal_ordinals_with_cons[0]))
#        true
#     else
#        false
#     end
#   end
#
#   def validate_ship_length?(ship, coordinates)
#     if ship.length != coordinates.length
#       false
#     else
#       true
#     end
#   end
#
#   def coordinate_conversion(coordinates)
#     temp_coordinates = []
#     coordinates.each do |coordinate|
#       temp_coordinates << coordinate.split("")
#       temp_coordinates = temp_coordinates.flatten
#     end
#     @vertical_coordinates = temp_coordinates.select{|x| temp_coordinates.index(x) % 2 == 0}
#     @horizontal_coordinates = temp_coordinates.select{|x| temp_coordinates.index(x) % 2 != 0}
#     # coordinate_conversion_ordinal
#     # binding.pry
#   end
# #
  # def coordinate_conversion_ordinal
  #   @vertical_coordinates.each do |coordinate|
  #     @vertical_ordinals = @vertical_ordinals << coordinate.ord
  #   end
  #   @horizontal_coordinates.each do |coordinate|
  #     @horizontal_ordinals = @horizontal_ordinals << coordinate.to_i
  #   end
  #   # vertical_ordinal_difference
  # end
#
#   def vertical_ordinal_difference
#     @total_vertical_ordinal_difference = 0
#     if @vertical_ordinals.count % 2 == 0
#       @total_vertical_ordinal_difference = 0
#     else
#       @total_vertical_ordinal_difference = @vertical_ordinals[0]
#     end
#
#     @vertical_ordinals.each do |ordinal|
#       @total_vertical_ordinal_difference = (@total_vertical_ordinal_difference).abs - (ordinal).abs
#     end
#     @total_vertical_ordinal_difference = @total_vertical_ordinal_difference.abs
#     # binding.pry
#   end
#
#   def horizontal_ordinal_difference
#     # binding.pry
#     if @horizontal_ordinals.count % 2 == 0
#       @total_horizontal_ordinal_difference = 0
#     else
#       @total_horizontal_ordinal_difference = @horizontal_ordinals[0]
#     end
#     @horizontal_ordinals.each do |ordinal|
#       @total_horizontal_ordinal_difference = (@total_horizontal_ordinal_difference).abs - (ordinal).abs
#     end
#     @total_horizontal_ordinal_difference = @total_horizontal_ordinal_difference.abs
#   end
#
#   def horizontal_ordinal_comparision
#     @horizontal_ordinals.each_cons(@horizontal_ordinals.length) do |x|
#       @horizontal_ordinals_with_cons << x
#     end
#   end
#
#   def valid_coordinate?(coordinate)
#     @cells.has_key?(coordinate)
#   end
#
#
# end


class Validation
  attr_reader :vertical_ordinals,
              :horizontal_ordinals

  def valid_placement(coordinates)
    coordinate_conversion(coordinates)

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
    binding.pry
  end

end


validate = Validation.new
validate.coordinate_conversion(["A1","A2","A3"])
