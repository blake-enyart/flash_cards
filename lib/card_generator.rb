require 'pry'

class CardGenerator

  attr_reader :lines

  def initialize(filename)
    # file = File.new(filename)
    @lines = File.readlines(filename)
    @lines = @lines.map{|line| line.chomp.split(',')}

    binding.pry
    #separate on commas into array
    #turn that into card objects
    #shovel card objects into array

    #turn array into card object with values from txt associated with attributes of card
  end
end
