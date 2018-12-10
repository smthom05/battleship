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

  def test_vertical_placement_validation
  assert_equal true, @validation.validate_placement(["A1", "B1", "C1"])
  assert_equal true, @validation.validate_placement(["B3", "C3", "D3"])
  assert_equal true, @validation.validate_placement(["A4", "B4", "C4"])
  assert_equal false, @validation.validate_placement(["A4", "B3", "C4"])
  assert_equal false, @validation.validate_placement(["A1", "B2", "B2"])
  assert_equal false, @validation.validate_placement(["A1", "A1", "A1"])

  end
end
