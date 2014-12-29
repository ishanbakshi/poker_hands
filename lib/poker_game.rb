class PokerGame

  def winning_hand(both_hands)
    hands = HandsParser.parse(both_hands) 
    winning_hand = HandsEvaluator.high_card(hands[0], hands[1])
    winning_hand.name
  end

end
