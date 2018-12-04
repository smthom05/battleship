require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
     @ship = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @ship
  end

  def test_it_has_a_name
    assert_equal "Cruiser", @ship.name
  end

  def test_it_has_a_length
    assert_equal 3, @ship.length
  end

  def test_it_has_health
    assert_equal 3, @ship.health
  end

  def test_ship_is_sunk
    assert_equal false, @ship.sunk?
  end

  def test_ship_loses_health_when_hit
    assert_equal 3, @ship.health
    @ship.hit
    assert_equal 2, @ship.health
  end

  def test_isnt_sunk_yet
    @ship.hit
    assert_equal false, @ship.sunk?
  end

  def test_ship_sinks
    @ship.hit
    @ship.hit
    @ship.hit
    assert_equal true, @ship.sunk?
  end
end
