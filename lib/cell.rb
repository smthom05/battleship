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
    if @fired_upon == true && @empty == true
      p "M"
      #cell fired upon & contains a ship
    elsif @fired_upon == true && @ship.sunk == true
      p "X"

    elsif @fired_upon == true && @empty == false
      p "H"
      #cell fired upon & ship is sunk

    else
      p "."
    end
  end
end
