class Card
  attr_reader :card_front

  	@@deck = %w(ah ac ad as 2h 2c 2d 2s 3h 3c 3d 3s 
              4h 4c 4d 4s 5h 5c 5d 5s 6h 6c 6d 6s 
              7h 7c 7d 7s 8h 8c 8d 8s 9h 9c 9d 9s 
              th tc td ts jh jc jd js qh qc qd qs 
              kh kc kd ks)	

	def self.shuffle
  	@@pos = 0
  	@@deck.sort_by { rand }
  end

	def initialize
		@card_front = @@deck[@@pos]
 		@@pos += 1
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