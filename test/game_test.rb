require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require "./lib/game"

class GameTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    assert_instance_of Game, game
  end

  def test_it_has_readable_attributes
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    assert_equal player1, game.player1
    assert_equal player2, game.player2
    assert_equal 0, game.turn_count
  end


  def test_basic_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    deck1 = Deck.new([card1, card4])
    deck2 = Deck.new([card2, card3])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)
    game.start

    assert_equal "Megan", game.winner
  end

  def test_war_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:diamond, 'Jack', 11)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, '4', 4)
    card5 = Card.new(:club, 'King', 13)
    card6 = Card.new(:spade, 'Ace', 14)
    deck1 = Deck.new([card1, card4, card5])
    deck2 = Deck.new([card2, card3, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)
    game.start

    assert_equal "Aurora", game.winner
  end

  def test_mutually_assured_destruction
    card1 = Card.new(:spade, '10', 10)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:diamond, 'Queen', 12)
    card6 = Card.new(:club, 'Queen', 12)
    card7 = Card.new(:diamond, 'Ace', 14)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card4, card5, card7])
    deck2 = Deck.new([card2, card3, card6, card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)
    game.start

    assert_equal "Megan", game.winner
  end


  def test_war_on_last_turn
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, '9', 9)
    deck1 = Deck.new([card1, card4])
    deck2 = Deck.new([card2, card3])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)
    game.start

    assert_equal "Megan", game.winner
  end

end
