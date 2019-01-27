require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class TurnTest < Minitest::Test

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [card_1, card_2, card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_does_round_exist
    assert_instance_of Round, @round
  end

  def test_round_has_deck_method
    assert_equal @deck, @round.deck
  end

  def test_round_has_turns_method_with_empty_array
    assert_equal [], @round.turns
  end

  def test_take_turn_method_turns_array_not_empty
    @round.take_turn("Juneau")

    assert_equal 1, @round.turns.length
  end

  def test_take_turn_method_correct_object
    turn = @round.take_turn("Juneau")

    assert_equal turn, @round.turns[0]
    assert_instance_of Turn, @round.turns[0]
    assert_instance_of Turn, @round.take_turn("Juneau")
    assert_equal "Juneau", @round.take_turn("Juneau").guess
  end

  def test_current_card_increments_forward
    turn_1 = @round.take_turn("Juneau")

    assert_equal @cards[1], @round.current_card
    turn_2 = @round.take_turn("Juneau")

    assert_equal @cards[2], @round.current_card
  end

  def test_take_turn_number_correct_increments_correctly
    turn_true = @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
    turn_false = @round.take_turn("Fargo")

    assert_equal 1, @round.number_correct
  end

  def test_turns_increments_correctly
    turn_1 = @round.take_turn("Juneau")

    assert_equal 1, @round.turns.count
    turn_2 = @round.take_turn("Juneau")

    assert_equal 2, @round.turns.count
  end

  def test_feedback_output_is_correct
    turn = @round.take_turn("Fargo")

    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_number_correct_by_category_method
    @round.take_turn('Juneau')

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct_method
    @round.take_turn('Juneau')
    @round.take_turn('Venus')

    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category_geography
    @round.take_turn('Juneau')

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

  def test_percent_correct_by_category_stem
    @round.take_turn('Juneau')
    @round.take_turn('Mars')

    assert_equal 100.0, @round.percent_correct_by_category(:STEM)
  end

  def test_percent_correct_by_category_stem_lower
    @round.take_turn('Juneau')
    @round.take_turn('Mars')
    @round.take_turn('Mars')

    assert_equal 50.0, @round.percent_correct_by_category(:STEM)
  end
end
