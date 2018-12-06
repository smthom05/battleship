

class Validation

  attr_reader :vertical_coordinates,
              :horizontal_coordinates,
              :vertical_ordinals,
              :horizontal_ordinals,
              :total_vertical_ordinal_difference,
              :total_horizontal_ordinal_difference


    def initialize()
      @vertical_coordinates = []
      @horizontal_coordinates = []
      @vertical_ordinals = []
      @horizontal_ordinals = []
      @total_vertical_ordinal_difference = 0
      @total_horizontal_ordinal_difference
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
          vertical_ordinal_difference
      end

      def vertical_ordinal_difference
        if @vertical_ordinals.count % 2 == 0
          @total_vertical_ordinal_difference = 0
        else
          @total_vertical_ordinal_difference = @vertical_ordinals[0]
        end

        @vertical_ordinals.each do |ordinal|
            @total_vertical_ordinal_difference = (@total_vertical_ordinal_difference).abs - (ordinal).abs
        end
        @total_vertical_ordinal_difference = @total_vertical_ordinal_difference.abs
        # binding.pry
        horizontal_ordinal_difference
      end

        def horizontal_ordinal_difference
        if @horizontal_ordinals.count % 2 == 0
          @total_horizontal_ordinal_difference = 0
        else
          @total_horizontal_ordinal_difference = @horizontal_ordinals[0]
        end

        @horizontal_ordinals.each do |ordinal|
            @total_horizontal_ordinal_difference = (@total_horizontal_ordinal_difference).abs - (ordinal).abs
        end
        @total_horizontal_ordinal_difference = @total_horizontal_ordinal_difference.abs
      end


      def valid_coordinate?(coordinate)
        @cells.has_key?(coordinate)
      end
end
