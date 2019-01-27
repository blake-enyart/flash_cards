require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_it_exists

    assert_instance_of Card, @card
  end

  def test_it_has_a_question
    question = "What is the capital of Alaska?"

    assert_equal question, @card.question
  end

  def test_it_has_an_answer
    answer = "Juneau"

    assert_equal answer, @card.answer
  end

  def test_it_has_a_category
    category = :Geography

    assert_equal category, @card.category
  end
end
