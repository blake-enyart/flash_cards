require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class TurnTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
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
  end

end
