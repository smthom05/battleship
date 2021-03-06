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
    assert_instance_of Board, @board
  end

  def test_it_a_cell
    assert_instance_of Cell, @board.cells["A1"]
  end

  def test_it_has_16_cells
    assert_equal 16, @board.cells.count
  end

  def test_coordinate_is_on_board
    assert_equal true, @board.valid_coordinate?('A1')
    assert_equal true, @board.valid_coordinate?('D4')
    assert_equal false, @board.valid_coordinate?('A5')
    assert_equal false, @board.valid_coordinate?('E1')
    assert_equal false, @board.valid_coordinate?('A22')
  end

  def test_coordinate_is_empty
    @board.place(@cruiser, ["A1","A2", "A3"])
    @board.place(@sub, ["A1","A2"])
    assert_equal false, @board.validate_cells_are_empty?(["A1","A2"])
    assert_equal true, @board.validate_cells_are_empty?(["B4","B3"])
  end

  def test_diagonal_coordinates_fail
    assert_equal false, @board.validate_placement?(@cruiser, ["A1", "B2", "C3"])
  end

  def test_vertical_placement_board
    assert_equal true, @board.validate_placement?(@cruiser, ["B3", "C3", "D3"])
    assert_equal true, @board.validate_placement?(@cruiser, ["A4", "B4", "C4"])
    assert_equal true, @board.validate_placement?(@cruiser, ["A1", "B1", "C1"])
    assert_equal false, @board.validate_placement?(@cruiser, ["A4", "B3", "C4"])
    assert_equal false, @board.validate_placement?(@cruiser, ["A1", "B2", "B2"])
  end

  def test_horizontal_placement_board
    assert_equal false, @board.validate_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.validate_placement?(@cruiser, ["A1", "A2", "B1"])
    assert_equal true, @board.validate_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.validate_placement?(@cruiser, ["B2", "C3", "C4"])
    assert_equal false, @board.validate_placement?(@cruiser, ["A2", "D2", "C2"])
  end


  def test_cell_knows_if_it_has_a_ship
    @board.place(@cruiser,["A1", "A2", "A3"])

    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    cell_4 = @board.cells["D4"]

    assert_instance_of Ship, cell_1.ship
    assert_instance_of Ship, cell_2.ship
    assert_instance_of Ship, cell_3.ship
    refute_instance_of Ship, cell_4.ship
  end

  def test_ships_are_the_same_between_cells
    @board.place(@cruiser,["A1", "A2", "A3"])

    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]

    assert_equal true, cell_1.ship == cell_2.ship
  end

  def test_board_will_render_without_showing_user_ships
    skip
    @board.place(@cruiser,["A1", "A2", "A3"])
    @board.place(@submarine,["D1", "D2"])

    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", @board.render
  end

  def test_board_will_render_with_showing_user_ships
    skip
    @board.place(@cruiser,["A1", "A2", "A3"])
    @board.place(@submarine,["D1", "D2"])

    assert_equal "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD S S . . \n", @board.render(true)
  end

end
