class PokerGame

  def winning_hand(both_hands)
    hands = HandsParser.parse(both_hands) 
    winning_hand = HandsEvaluator.winning_hand(hands[0], hands[1])
    winning_hand.name
  end

end
