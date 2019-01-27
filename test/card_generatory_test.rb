require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

class CardGeneratorTest < Minitest::Test

  def setup
    filename = './lib/cards.txt'
    @card_generator = CardGenerator.new(filename)
  end

  def test_does_card_generator_exist

    assert_instance_of CardGenerator, @card_generator
  end

end
