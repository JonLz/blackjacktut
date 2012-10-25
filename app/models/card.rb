class Card
  attr_reader :card_front

  @@deck = Array.new
 	%w[c s d h].each do |suit| 
		%w[a 2 3 4 5 6 7 8 9 t j q k].each do |card| 
	 		@@deck << card.to_s + suit 
		end
  end

	def initialize
		@card_front = @@deck[@@pos]
 		@@pos += 1
	end

	def self.shuffle
  	@@pos = 0
  	@@deck.shuffle!
  end

  # calculates card value
  # card is the card to value
  # score is the current hand score, used in calculation of aces
  def self.value(card, score)
  	if card =~ /\d/ then
  		value = card[0].to_i 
  	elsif card =~ /a/ then
  		value = 11
  		value = 1 if score + 11 > 21
  	else
  		value = 10
  	end

  	value
  end

end