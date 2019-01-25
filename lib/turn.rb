class Turn
  attr_reader :card,
              :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  # def card
  #   return card
  # end
  #
  # def correct?
  #   # if string == card
  #   #   return true
  #   # else
  #   #   return false
  #   #
  # end
end
