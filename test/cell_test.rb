require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def setup
     @cell = Cell.new("B4")
  end


  def test_cell_exists
    assert_instance_of Cell, @cell
    end

  def test_cell_has_a_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_cell_has_a_ship
    assert_equal nil, @cell.ship
  end

  def test_cell_can_be_empty
    assert_equal true, @cell.empty?
  end

  def test_ship_can_be_placed
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, @cell.place_ship(cruiser)
  end

  def test_cell_is_empty_after_ship_placement
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    assert_equal false, @cell.empty?
  end

end
