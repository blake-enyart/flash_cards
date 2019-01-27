require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

# Create some Cards

#Need to modify this to take in card generator functionality
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

# Put those card into a Deck
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)
# Create a new Round using the Deck you created
# Start the round using a new method called start (round.start)
while round.deck.cards.index(round.current_card) != nil
  round.start()

  puts "This is card number #{round.deck.cards.index(round.current_card)+1} of #{round.deck.cards.length}."
  puts "Question: #{round.current_card.question}"

  guess = gets.chomp()
  round.take_turn(guess)
end

puts "*"*10 + " Game over! " + "*"*10
puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.length} for a total score of #{round.percent_correct}%"

category_list = []
for card in round.deck.cards do
  category_list << card.category
end

category_list = category_list.uniq

for category in category_list do
  puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
end
