class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = nil
  end

  def type
    return :war if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
    :basic
  end


end
