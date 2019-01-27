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
end
