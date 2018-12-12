require 'pry'

class Validation

  def validate_ship_length?(ship, coordinates)
    if ship.length != coordinates.length
      false
    else
      true
    end
  end

  def validate_duplicate_coordinate?(ship, coordinates)
    uniq_coordinates = []
    uniq_coordinates = coordinates.uniq
    if uniq_coordinates.count != ship.length
      false
    else
      true
    end
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
    coordinates.each_cons(2) do |a, b|
      if b[0].ord - a[0].ord != 1
        return false
      end
    end
    coordinates.all? do |coordinate|
      coordinate[1] == coordinates.first[1]
    end
  end

  end

# Previous validation attempt with ordinal differencs

  # def coordinate_conversion(coordinates)
  #   temp_coord = []
  #
  #   coordinates.each do |coordinate|
  #     temp_coord << coordinate.split('').flatten
  #     temp_coord = temp_coord.flatten
  #   end
  #   coordinate_ordinal_conversion(temp_coord)
  # end
  #
  # def coordinate_ordinal_conversion(coordinates)
  #   # numbers
  #   temp_vertical_coordinates = []
  #   @vertical_ordinals = []
  #
  #   # letters
  #   temp_horizontal_coordinates = []
  #   @horizontal_ordinals = []
  #
  #   temp_vertical_coordinates = coordinates.select{|x| coordinates.index(x) % 2 != 0}
  #   temp_horizontal_coordinates = coordinates.select{|x| coordinates.index(x) % 2 == 0}
  #
  #   temp_vertical_coordinates.each do |coordinate|
  #     @vertical_ordinals << coordinate.to_i
  #   end
  #
  #   temp_horizontal_coordinates.each do |coordinate|
  #     @horizontal_ordinals << coordinate.ord
  #   end
  #   ordinal_differences
  # end
  #
  # def ordinal_differences
  #   @tot_vert_diff = 0
  #   if @vertical_ordinals.count % 2 == 0
  #     @tot_vert_diff = 0
  #   else
  #     @tot_vert_diff = @vertical_ordinals[0]
  #   end
  #   @vertical_ordinals.each do |ordinal|
  #     @tot_vert_diff = @tot_vert_diff.abs - ordinal.abs
  #   end
  #   @tot_vert_diff = @tot_vert_diff.abs
  #
  #   @tot_hor_diff = 0
  #   if @horizontal_ordinals.count % 2 == 0
  #     @tot_hor_diff = 0
  #   else
  #     @tot_hor_diff = @horizontal_ordinals[0]
  #   end
  #   @horizontal_ordinals.each do |ordinal|
  #     @tot_hor_diff = @tot_hor_diff.abs - ordinal.abs
  #   end
  #   @tot_hor_diff = @tot_hor_diff.abs
  # end
  #
  # def vertical_validation?
  #   if @tot_vert_diff != 0
  #     false
  #   elsif all_same_vert? && @tot_hor_diff == 1
  #     true
  #   else
  #     false
  #   end
  # end
  #
  # def all_same_horizontal?
  #   @horizontal_ordinals.all? do |ordinal|
  #     ordinal == @horizontal_ordinals.first
  #   end
  # end
  #
  # def horizontal_validation?
  #
  #   if @tot_hor_diff != 0
  #     false
  #   elsif all_same_horizontal? && @tot_vert_diff == 1
  #     true
  #   else
  #     false
  #   end
  # end
  #
  # def all_same_vert?
  #   @vertical_ordinals.all? do |ordinal|
  #     ordinal == @vertical_ordinals.first
  #   end
  # end
