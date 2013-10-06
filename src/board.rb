require './tile.rb'
class Board
  include Enumerable

  def initialize(width,height,mines)
    @width = width
    @height = height
    @mines = mines
    @tiles = []
    @width.times do |i|
      @tiles.push([])
      @height.times do |j|
        @tiles[i][j] = Tile.new(0,true)
      end
    end
    
    place_mines
  end

  def place_mines
    self.to_s
    @mines.times do 
      row = Random.rand(0..@width-1)
      col = Random.rand(0..@height-1)
      puts "Random (#{row},#{col})"
      if @tiles[row][col].value.kind_of? (String)
        redo
      end
      @tiles[row][col].value = "*"
      self.to_s
      puts "="*80
      [-1,0,1].each do |i|
        [-1,0,1].each do |j|
          nrow = row+i
          ncol = col+j
          if nrow.between?(0,@height-1) and ncol.between?(0,@width-1) and @tiles[nrow][ncol].value.kind_of?(Fixnum)
            @tiles[nrow][ncol].value += 1               
          end
        end
      end
    end
  end

  def to_s
    # print "="*80
    # for i in 0..@width-1
    #   for j in 0..@height-1
    #     print "#{self.tiles[i][j].value}\t"
    #   end
    #   print "\n"
    # end

    @tiles.each do |row|
      row.each do |t|
        print "#{t.value}|" 
      end
      print "\n"
    end
  end
  alias_method :print_board, :to_s
  attr_reader :tiles
end
b = Board.new(4,4,15)
b.to_s

