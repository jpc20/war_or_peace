require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'
require 'pry'

class CardGeneratorTest < Minitest::Test
  def setup
    @card_generator = CardGenerator.new('./lib/cards.txt')
  end

  def test_it_exists
    assert_instance_of CardGenerator, @card_generator
  end

  def test_it_outputs_cards
    @card_generator.generate_cards
    assert_instance_of Card, @card_generator.cards.first
  end

  def test_it_generates_52_cards
    @card_generator.generate_cards
    assert_equal 52, @card_generator.cards.length
  end


end
