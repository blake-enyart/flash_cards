class Round
  attr_reader :deck,
              :number_correct,
              :turns,
              :current_card,
              :correct_turns

  def initialize(deck)
    @deck = deck
    @number_correct = 0
    @turns = []
    @current_card = @deck.cards[0]
    @correct_turns = []
  end

  def take_turn(guess)
    #make turn object
    a_turn = Turn.new(guess, @current_card)
    #put turn object into turn array
    @turns << a_turn
    #check if it is correct and track
    if a_turn.correct?
      @number_correct += 1
      @correct_turns << a_turn
    end
    #increment current card
    @current_card = @deck.cards[@turns.length]
    return a_turn
  end

  def number_correct_by_category(cat)
    cat_cnt =  @correct_turns.select{|turn|
              turn.card.category == cat}.count
    return cat_cnt
  end

  def percent_correct
    per = (@number_correct.to_f/@turns.length).round(2)*100
    return per
  end

  def correct_guesses_by_category(cat)
    cat_cor = @turns.select{|turn| turn.card.category == cat}
    return cat_cor.length
  end

  def percent_correct_by_category(cat)
    per_cat = number_correct_by_category(cat).to_f/
              correct_guesses_by_category(cat)
    per_cat *= 100
    per_cat = per_cat.round(2)
    return per_cat
  end

  def start
    puts "Welcome! You're playing with #{@deck.cards.length} cards."
    puts "-"*15
  end
end
