require 'pry'

class Cell

attr_reader :coordinate,
            :empty,
            :ship,
            :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @empty = false
    @ship = ship

  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @empty == false
      @ship.hit
    else
      @ship
      # return corresponding symbol
    end
  end

  def render
      #if cell is fired upon but doesn't contain a ship
    if @fired_upon && @empty
      p "M"
      #cell fired upon & ship is sunk
    elsif @fired_upon && @ship.sunk
      p "X"
      #cell fired upon & contains a ship
    elsif @fired_upon && @empty == false
      p "H"
      # Cell not fired up yet
    else
      p "."
    end
  end
end
