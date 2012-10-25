class Hand
 attr_accessor :cards, :score
  
  def initialize
    @cards = []
    @score = 0
  end

  def self.score_of(hand)
   
    score = 0
    
    hand.cards.each do |card|
      if card.card_front !~ /a/
        score += Card.value(card.card_front, score)
      end
    end
    
    hand.cards.each do |card|
      if card.card_front =~ /a/
        score += Card.value(card.card_front, score)
      end
    end
    
    score
  end
end