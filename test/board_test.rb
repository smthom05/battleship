require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test


  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    skip
    assert_instance_of Board, @board
  end

  def test_it_a_cell
    assert_instance_of Cell, @board.cells["A1"]
  end

  def test_it_has_16_cells
    skip
    assert_equal 16, @board.cells.count
  end

  def test_coordinate_is_on_board

    assert_equal true, @board.valid_coordinate?('A1')
    assert_equal true, @board.valid_coordinate?('D4')
    assert_equal false, @board.valid_coordinate?('A5')
    assert_equal false, @board.valid_coordinate?('E1')
    assert_equal false, @board.valid_coordinate?('A22')
  end


  # def test_valid_placement_based_only_on_ship_length
  #   assert_equal false, @board.valid_placement?(@submarine, ["B1", "B2", "B3"])
  #   assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
  #   assert_equal true, @board.valid_placement?(@cruiser, ["C1", "C2", "C3"])
  # end
  #
  # def test_valid_placement_based_on_coordinates_being_subsequent
  #   assert_equal false, @board.coordinate_conversion(["A1", "A2", "A4"])
  # end

  def test_ship_placed_on_cells
    assert_equal true, @board.place(@cruiser,["A1", "A2", "A3"])
  end
end
