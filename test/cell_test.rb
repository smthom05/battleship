require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

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

  def test_cell_knows_it_has_been_fired_upon
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)

    assert_equal false, @cell.fired_upon?

    @cell.fire_upon

    assert_equal true, @cell.fired_upon
  end

  def test_health_goes_down_after_fired_upon
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    @cell.fire_upon



    assert_equal 2, @cell.ship.health
  end

  def test_cell_render_not_hit
    @cell.render
    assert_equal ".", @cell.render
  end

  def test_cell_render_miss
    @cell.fire_upon
    @cell.render
    assert_equal "M", @cell.render
  end

  def test_cell_render_hit
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    @cell.fire_upon
    @cell.render
    assert_equal "H", @cell.render
  end

  def test_cell_has_been_sunk
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    @cell.fire_upon
    @cell.fire_upon
    @cell.fire_upon
    @cell.render
    assert_equal "X", @cell.render
  end
end
