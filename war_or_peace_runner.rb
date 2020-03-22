require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

# suits = [:club, :diamond, :heart, :spade]
# values = {'2' => 2, '3' => 3, '4'=> 4, '5' => 5, '6'=> 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'Jack' => 11, 'Queen' => 12, "King" => 13, "Ace" => 14}
# cards = []
#
# suits.each do |suit|
#   values.each do |key, value|
#     cards << card = Card.new(suit, key, value)
#   end
# end
#
# cards = cards.shuffle

generator = CardGenerator.new('./lib/cards.txt')
generator.generate_cards
cards = generator.cards.shuffle
deck1 = Deck.new(cards[0..25])
deck2 = Deck.new(cards[26..51])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)


game = Game.new(player1, player2)
game.start
