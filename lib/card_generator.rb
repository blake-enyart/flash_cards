require 'pry'

class CardGenerator

  attr_reader :lines, :cards

  def initialize(filename)
    # file = File.new(filename)
    @cards = []
    @lines = File.readlines(filename)
    @lines = @lines.map{|line| line.chomp.split(',')}
    for line in @lines do
      card = Card.new(line[0],line[1],line[2])
      @cards << card
    end
    #separate on commas into array
    #turn that into card objects
    #shovel card objects into array

    #turn array into card object with values from txt associated with attributes of card
  end
end
