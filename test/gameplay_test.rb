require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/validation'
require './lib/gameplay'
require 'pry'

class GameplayTest < Minitest::Test

def setup
  @gameplay = Gameplay.new
  @submarine = Ship.new("Submarine", 2)
  @cruiser = Ship.new("Cruiser", 3)
  @board = Board.new
  @validation = Validation.new
end

def test_gameplay_exists
  assert_instance_of Gameplay, @gameplay
end

def test_start_method_runs
  skip
  assert_equal "Welcome to BATTLESHIP\n Enter p to play. Enter q to quit. ", @gameplay.start
end

def test_cpu_sub_placement_is_valid
  assert_equal "It Works", @gameplay.cpu_sub_creation
end

def test_cpu_cruiser_placement_is_valid
  assert_equal "It Works", @gameplay.cpu_cruiser_creation
end
end
