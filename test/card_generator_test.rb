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

  def test_io_readlines_correctly_loads_in_txt_file
    filename = './lib/test.txt'
    @card_generator = CardGenerator.new(filename)

    assert_equal "test", @card_generator.lines[0].chomp
  end

  def test_io_readlines_correctly_loads_in_array_of_lines
    filename = './lib/test_mult.txt'
    @card_generator = CardGenerator.new(filename)

    assert_equal "test2", @card_generator.lines[1].chomp
  end

    def test_io_instantiated_object_splits_line_on_comma
      filename = './lib/test_mult.txt'
      @card_generator = CardGenerator.new(filename)
      binding.pry

      assert_equal ["test3","test3","test3"], @card_generator.lines[2]

    end

end
