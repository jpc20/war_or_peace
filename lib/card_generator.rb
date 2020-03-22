class CardGenerator
  attr_reader :text_file, :cards
  def initialize(text_file)
    @text_file = text_file
    @cards = []
  end

  def generate_cards
    File.foreach(@text_file) do |line|
      split_line = line.split(',')
      suit = split_line[0].delete(":").to_sym
      value = split_line[1].gsub("'", "")
      rank = split_line[2].strip.to_i
      @cards << Card.new(suit, value, rank)
    end

  end
end
