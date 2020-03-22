class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.cards.length >= 3 && @player2.deck.cards.length >= 3 && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war
    else
      return :basic
    end
  end

  def winner
    if type == :basic
      return @player1 if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player2
    elsif type == :war
      return @player1 if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player2
    elsif type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def card_to_spoils(player, num_cards)
    (num_cards).times do
      @spoils_of_war << player.deck.cards[0]
      player.deck.remove_card
    end
  end

  def pile_cards
    if type == :basic
      card_to_spoils(@player1, 1)
      card_to_spoils(@player2, 1)
    elsif type == :mutually_assured_destruction
      (3).times { @player1.deck.remove_card }
      (3).times { @player2.deck.remove_card }
    elsif type == :war
      card_to_spoils(@player1, 3)
      card_to_spoils(@player2, 3)
    end
  end

  def award_spoils(winner)
    if winner == "No Winner"
      return
    else
      winner.deck.cards += @spoils_of_war.shuffle
      @spoils_of_war.clear
    end
  end

end
