require './tile.rb'
class Board
  include Enumerable

  alias_method :print_board, :to_s
  attr_reader :tiles

  def initialize(width,height,mines)
    @width = width
    @height = height
    @mines = mines
    @tiles = []
    @width.times do |i|
      @tiles.push([])
      @height.times do |j|
        @tiles[i][j] = Tile.new(0,false)
      end
    end
    place_mines
  end

  def place_mines
    @mines.times do 
      row = Random.rand(0..@width-1)
      col = Random.rand(0..@height-1)
      if @tiles[row][col].value.kind_of? (String)
        redo
      end
      @tiles[row][col].value = "*"
      self.each_neighbour(row,col) {|nb| nb.value += 1}
    end
  end

  def dig_tile!(row,col)
    val = @tiles[row][col].dig.to_s
    if val == "0"
      self.each_neighbour(row,col) {|nb| nb.dig}
    end
    val
  end

  def each_neighbour(row,col)
    [-1,0,1].each do |i|
      [-1,0,1].each do |j|
        nrow = row+i
        ncol = col+j
        if nrow.between?(0,@height-1) and ncol.between?(0,@width-1) and 
                                      @tiles[nrow][ncol].value.kind_of?(Fixnum)
          yield @tiles[nrow][ncol]
        end
      end
    end
  end

  def to_s

    @tiles.each do |row|
      row.each do |t|
        print "#{t.see}|" 
      end
      print "\n"
    end
  end
  
end


