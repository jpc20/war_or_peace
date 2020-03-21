class Game
  attr_reader :player1, :player2, :turn_count
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
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

  def start
    welcome()

    until player1.has_lost? || player2.has_lost? || @turn_count == 1000000
      @turn_count +=1
    end

  end

end
