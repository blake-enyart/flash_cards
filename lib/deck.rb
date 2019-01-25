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
    same_cat = []
    @cards.each do |card|
      if card.category == category
        same_cat << card
      end
    end
    return same_cat
  end

end
