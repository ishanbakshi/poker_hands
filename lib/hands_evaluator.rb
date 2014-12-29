class HandsEvaluator

  def initialize
  end

  def self.winning_hand(black_hand, white_hand)
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

end
