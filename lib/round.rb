require 'pry'

class Round
  attr_reader :deck,
              :number_correct,
              :turns,
              :current_card

  def initialize(deck)
    @deck = deck
    @number_correct = 0
    @turns = []
    @current_card = @deck.cards[0]
  end

  def take_turn(guess)
    #make turn object
    a_turn = Turn.new(guess, @current_card)
    #put turn object into turn array
    @turns << a_turn
    #check if it is correct and track
    if a_turn.correct?
      @number_correct += 1
    end
    #increment current card
    return a_turn
  end
end
