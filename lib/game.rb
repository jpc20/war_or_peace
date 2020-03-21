class Game
  attr_reader :player1, :player2, :turn_count, :winner
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
    @winner = nil
  end

  def welcome
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
    input = gets.chomp
    until input.downcase == 'go'
      input = gets.chomp
    end
  end

  def execute_new_turn
    turn = Turn.new(@player1, @player2)
    @turn_count += 1
    if turn.type == :basic
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      p "Turn #{@turn_count}:  #{winner.name} won 2 cards"
    elsif turn.type == :war
      if @player1.deck.cards.length < 3
        @player1.deck.cards.clear
      elsif @player2.deck.cards.length < 3
        @player2.deck.cards.clear
      else
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        p "Turn #{@turn_count}:  WAR - #{winner.name} won 6 cards"
      end
    elsif turn.type == :mutually_assured_destruction
      turn.pile_cards
      p "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
    end
  end

  def determine_winner
    if @player1.has_lost? == true
      @winner = @player2.name
      p "*~*~*~* #{@winner} has won the game! *~*~*~*"
    elsif @player2.has_lost? == true
      @winner = @player1.name
      p "*~*~*~* #{@winner} has won the game! *~*~*~*"
    elsif @turn_count == 1000000
      p "---- DRAW ----"
    end
  end

  def start
    welcome()

    until @player1.has_lost? == true || @player2.has_lost? == true || @turn_count == 1000000
      execute_new_turn()
    end

    determine_winner

  end


end
