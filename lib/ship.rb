class Ship
  attr_reader :name,
              :length,
              :health,
              :sunk

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end

  def sunk?
    @sunk
  end

  def hit
    if @health > 1
      @health -= 1
    else
      @sunk = true
    end
  end
end
