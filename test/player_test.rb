require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
  end

  def test_it_exists
    cards = [@card1, @card2, @card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_it_has_readable_attributes
    cards = [@card1, @card2, @card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal 'Clarisa', player.name
    assert_equal player.deck.cards, deck.cards
  end

  def test_has_lost_false_by_default
    cards = [@card1]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal false, player.has_lost?
  end

  def test_player_loses_if_no_cards_left
    cards = [@card]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal false, player.has_lost?

    player.deck.remove_card
    assert_equal true, player.has_lost?
  end

end
