require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_does_deck_exist

    assert_instance_of Deck, @deck
  end

  def test_it_has_cards_method

    assert_equal @cards, @deck.cards
  end

  def test_it_has_count_method

    assert_equal 3, @deck.count
  end

  def test_it_has_cards_in_category_method_and_returns_correct_array

    assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)
  end

  def test_returns_correct_cards_if_geography_category_selected

    assert_equal [@card_1], @deck.cards_in_category(:Geography)
  end
end
