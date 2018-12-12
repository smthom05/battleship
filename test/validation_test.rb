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
    @validation = Validation.new
  end

  def test_it_exists
  assert_instance_of Validation, @validation
  end

  def test_placement_validation_on_ship_length_only
    assert_equal true, @validation.validate_ship_length?(@cruiser, ["A1", "B1", "C1"])
    assert_equal false,@validation.validate_ship_length?(@submarine, ["A1", "A2", "A3"])
    assert_equal false,@validation.validate_ship_length?(@cruiser, ["B1", "B2", "B3", "B4"])
  # assert_equal false,
  end

  def test_coordinates_must_be_unique
    assert_equal false, @validation.validate_duplicate_coordinate?(@cruiser, ["A1", "A1", "A1"])
    assert_equal false, @validation.validate_duplicate_coordinate?(@submarine, ["A3", "A3"])
  end

  # def test_vertical_coordinates_are_subsequent
    assert_equal true, @validation.valid_vertical?(["A1", "B1", "C1"])
  end

  def test_vertical_coordinates_are_not_subsequent
    assert_equal false, @validation.valid_vertical?(["A1", "B1", "D2"])
  end

  def test_horizontal_coordinates_are_subsequent
    assert_equal true, @validation.valid_horizontal?(["A1", "A2", "A3"])
  end

  def test_horizontal_coordinates_are_not_subsequent
    assert_equal false, @validation.valid_horizontal?(["A1", "A2", "A4"])
  end

end
