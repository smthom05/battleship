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
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_a_cell
    assert_instance_of Cell, @board.cells[:A1]
  end

  def test_it_has_16_cells
    assert_equal 16, @board.cells.count
  end
end
