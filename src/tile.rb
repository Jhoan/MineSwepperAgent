class Tile
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
    if @visible == true then
      @value
    else
      @default
    end
  end
  attr_reader :visible
  attr_accessor :value
end

