class Tile
  
  attr_reader :visible
  attr_accessor :value

  def initialize(value,visible)
    @value = value
    @visible = visible
    @default = "X"
  end
  def dig
    @visible = true
    @value
  end

  def see
    @visible ? @value : @default
  end

  
end

