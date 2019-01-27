# require 'pry'

class CardGenerator

  attr_reader

  def initialize(filename)
    file = File.new(filename)
    @lines = file.readlines
    @lines[0]
    #separate on commas into array
    #turn that into card objects
    #shovel card objects into array

    #turn array into card object with values from txt associated with attributes of card
  end
end
