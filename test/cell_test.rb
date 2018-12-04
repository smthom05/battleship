require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def setup
     @cell_1 = Cell.new("B4")
     @cell_2 = Cell.new("C3")
  end


  def test_cell_exists
    assert_instance_of Cell, @cell_1
    end

  def test_cell_has_a_coordinate
    assert_equal "B4", @cell_1.coordinate
  end

  def test_cell_has_a_ship
    assert_equal nil, @cell_1.ship
  end

  def test_cell_can_be_empty
    assert_equal true, @cell_1.empty?
  end

  def test_ship_can_be_placed
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, @cell_1.place_ship(cruiser)
  end

  def test_cell_is_empty_after_ship_placement
    cruiser = Ship.new("Cruiser", 3)
    @cell_1.place_ship(cruiser)
    assert_equal false, @cell_1.empty?
  end

  def test_cell_knows_it_has_been_fired_upon
    cruiser = Ship.new("Cruiser", 3)
    @cell_1.place_ship(cruiser)

    assert_equal false, @cell_1.fired_upon?

    @cell_1.fire_upon

    assert_equal true, @cell_1.fired_upon
  end

  def test_health_goes_down_after_fired_upon
    cruiser = Ship.new("Cruiser", 3)
    @cell_1.place_ship(cruiser)
    @cell_1.fire_upon



    assert_equal 2, @cell_1.ship.health
  end

  def test_cell_render_not_hit
    @cell_1.render
    assert_equal ".", @cell_1.render
  end

  def test_cell_render_miss
    @cell_1.fire_upon
    @cell_1.render
    assert_equal "M", @cell_1.render
  end

  def test_cell_render_hit
    cruiser = Ship.new("Cruiser", 3)
    @cell_1.place_ship(cruiser)
    @cell_1.fire_upon
    @cell_1.render
    assert_equal "H", @cell_1.render
  end

  def test_cell_has_been_sunk
    cruiser = Ship.new("Cruiser", 3)
    @cell_1.place_ship(cruiser)
    @cell_1.fire_upon
    @cell_1.fire_upon
    @cell_1.fire_upon
    @cell_1.render
    assert_equal "X", @cell_1.render
  end

  def test_cell_is_hidden
    cruiser = Ship.new("Cruiser", 3)
    @cell_1.place_ship(cruiser)
    @cell_1.render
    assert_equal ".", @cell_1.render
  end

  def test_cell_is_shown
    cruiser = Ship.new("Cruiser", 3)
    @cell_1.place_ship(cruiser)
    @cell_1.render(true)
    assert_equal "S", @cell_1.render(true)
  end
end
