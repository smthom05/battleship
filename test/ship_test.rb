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

  def test_it_has_attributes
    assert_equal "Cruiser", @ship.name
    assert_equal 3, @ship.length
    assert_equal 3, @ship.health
  end

  def test_ship_is_not_sunk_at_start
    assert_equal false, @ship.sunk?
  end

  def test_ship_loses_health_when_hit
    assert_equal 3, @ship.health
    @ship.hit
    assert_equal 2, @ship.health
  end

  def test_isnt_sunk_after_one_hit
    @ship.hit
    assert_equal false, @ship.sunk?
  end

  def test_ship_sinks
    3.times do
    @ship.hit
    end
    assert_equal true, @ship.sunk?
  end
end
