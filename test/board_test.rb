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
    skip
    assert_instance_of Board, @board
  end

  def test_it_a_cell
    skip
    assert_instance_of Cell, @board.cells[:A1]
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
end
