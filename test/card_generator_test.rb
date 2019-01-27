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

    assert_equal "test", @card_generator.lines[0][0].chomp
  end

  def test_io_readlines_correctly_loads_in_array_of_lines
    filename = './lib/test_mult.txt'
    @card_generator = CardGenerator.new(filename)

    assert_equal "test2", @card_generator.lines[1][0].chomp
  end

  def test_io_instantiated_object_splits_line_on_comma
    filename = './lib/test_mult.txt'
    @card_generator = CardGenerator.new(filename)
    line = ["test3","test3","test3"]
    assert_equal line , @card_generator.lines[2]
  end

  def test_card_generator_instantiated_object_creates_array_card_objects
    filename = './lib/test_mult.txt'
    @card_generator = CardGenerator.new(filename)

    assert_instance_of Card , @card_generator.cards[0]
  end

  def test_card_object_in_cards_has_appropriate_answer
    filename = './lib/test_mult.txt'
    @card_generator = CardGenerator.new(filename)
    
    assert_equal "Juneau" , @card_generator.cards[3].answer
  end

  def test_cards_txt_file_reads_in_correctly_and_first_question_answer_correct

    assert_equal "10", @card_generator.cards[0].answer
  end

end
