require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

# Create some Cards and put into deck
filename = './lib/cards.txt'

cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)

while round.deck.cards.index(round.current_card) != nil
  round.start()

  puts "This is card number #{round.deck.cards.index(round.current_card)+1} of #{round.deck.cards.length}."
  puts "Question: #{round.current_card.question}"

  guess = gets.chomp()
  round.take_turn(guess)
  round.turns.last.feedback
  puts
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
