require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/validation'

class ValidationTest < Minitest::Test

  def setup
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @board = Board.new
    @validate = Validation.new
  end

  def test_it_exists
    assert_instance_of Validation, @validate
  end

  def test_placement_is_valid_based_only_on_ship_length
    assert_equal false, @validate.validate_ship_length?(@submarine, ["B1", "B2", "B3"])
    assert_equal false, @validate.validate_ship_length?(@cruiser, ["A1", "A2"])
    assert_equal true, @validate.validate_ship_length?(@cruiser, ["C1", "C2", "C3"])
  end

  def test_placement_is_valid_based_on_horizontal_coordinates_being_subsequent
    # assert_equal true, @validate.validate(["A1", "A2", "A3"])
    assert_equal true, @validate.validate(["B1", "B2", "B3"])
  end

  def test_placement_is_valid_based_on_vertical_coordinates_being_subsequent
    skip
    @validate.validate(["A1", "B1", "C1"])

    # binding.pry
    assert_equal true, @validate.status
  end

  def test_placement_is_not_valid_based_on_horizontal_coordinates_not_being_subsequent
    skip  
    @validate.validate(["A1", "A3", "A4"])
    @validate.validate(["C1", "C3", "C4"])
    @validate.validate(["B1", "B2", "B4"])

    assert_equal false, @validate.status
    assert_equal false, @validate.status
    assert_equal false, @validate.status
  end

  def test_placement_is_not_valid_based_on_vertical_coordinates_not_being_subsequent
    skip
    @validate.validate(["A1", "B2", "C1"])

    assert_equal false, @validate.status
  end

end
