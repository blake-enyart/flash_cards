class CardGenerator

  attr_reader :cards

  def initialize(filename)
    # file = File.new(filename)
    @cards = []
    lines = File.readlines(filename)
    #separate on commas into array
    lines = lines.map{|line| line.chomp.split(',')}
    for line in lines do
      #turn that into card objects
      card = Card.new(line[0],line[1],line[2])
      #shovel card objects into array
      @cards << card
    end
  end
end
