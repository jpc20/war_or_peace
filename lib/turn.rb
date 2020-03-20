class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&  @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
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
      return @player1 if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      @player2
    elsif self.type == :mutually_assured_destruction
        return "No Winner"
    end
  end

  def card_to_spoils(player, num_cards)
    (num_cards).times do |i|
      @spoils_of_war << player.deck.cards[0]
      player.deck.remove_card
    end
  end


end
