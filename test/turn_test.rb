require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require 'pry'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists

    assert_instance_of Turn, @turn
  end

  def test_it_has_card

    assert_equal @card, @turn.card
  end

  def test_it_has_guess_method
    # card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    # turn = Turn.new("Juneau", card)

    assert_equal "Juneau", @turn.guess
  end

  def test_correct_guess_method
    assert_equal true, @turn.correct?
  end

  def test_it_has_feedback_method
    assert_equal "Correct!", @turn.feedback

  end

  def test_correct_is_false_for_wrong_answer
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    assert_equal false, turn.correct?
  end

  def test_feedback_returns_incorrect_answer
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    assert_equal "Incorrect.", turn.feedback
  end
  # def test_it_has_a_question
  #   skip
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #
  #   assert_equal "What is the capital of Alaska?", card.question
  # end
  #
  # def test_it_has_an_answer
  #   skip
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #
  #   assert_equal "Juneau", card.answer
  # end
  #
  # def test_it_has_a_category
  #   skip
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #
  #   assert_equal :Geography, card.category
  # end
end
