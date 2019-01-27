class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    count = cards.count
    return count
  end

  def cards_in_category(category)
      same_cat = @cards.select{|card| card.category == category}
    return same_cat
  end
end
