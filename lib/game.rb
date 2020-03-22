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

  def basic_turn(turn)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    p "Turn #{@turn_count}:  #{winner.name} won 2 cards"
  end

  def war_turn(turn)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    p "Turn #{@turn_count}:  WAR - #{winner.name} won 6 cards"
  end

  def war_on_last_turn
    if @player1.deck.cards.length < 3
      @player1.deck.cards.clear
      p "Turn #{@turn_count}:  WAR - #{@player2.name} won the game"
    elsif @player2.deck.cards.length < 3
      @player2.deck.cards.clear
      p "Turn #{@turn_count}:  WAR - #{@player1.name} won the game"
    end
  end

  def mutually_assured_destruction_turn(turn)
    turn.pile_cards
    p "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
  end

  def determine_winner
    if @player1.has_lost? == true
      @winner = @player2.name
      winner_message()
    elsif @player2.has_lost? == true
      @winner = @player1.name
      winner_message()
    elsif @turn_count == 1000000
      p "---- DRAW ----"
    end
  end

  def winner_message
    p "*~*~*~* #{@winner} has won the game! *~*~*~*"
  end

  def execute_new_turn
    turn = Turn.new(@player1, @player2)
    @turn_count += 1
    if turn.type == :basic
      basic_turn(turn)
    elsif turn.type == :war
      if @player1.deck.cards.length < 3 || @player2.deck.cards.length < 3
        war_on_last_turn()
      else
        war_turn(turn)
      end
    elsif turn.type == :mutually_assured_destruction
      mutually_assured_destruction_turn(turn)
    end
  end

  def start
    welcome()
    until @player1.has_lost? == true || @player2.has_lost? == true || @turn_count == 1000000
      execute_new_turn()
    end
    determine_winner()
  end

end
