class HandsEvaluator

  def initialize
  end

  def self.high_card(black_hand, white_hand)
    if compare(black_hand.highest_card, white_hand.highest_card) > 0
      black_hand
    else
      white_hand
    end
  end

  private

  def self.compare(cardA, cardB)
    if Card.value(cardA) > Card.value(cardB)
      return 1
    else
      return -1
    end
  end
  def self.card_with_pair(black_hand,white_hand)
    if black_hand.pair != "no_pair"
        black_hand
    elsif white_hand.pair != "no_pair"
        white_hand
    else 
      "no_pair"
    end    
  end
end
