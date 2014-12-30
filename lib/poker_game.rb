class PokerGame

  def winning_hand(both_hands)
    hands = HandsParser.parse(both_hands) 
   # winning_hand = HandEvaluator.card_with_pair(hands[0], hands[1])
   # if(winning_hand == "no_pair")         
      winning_hand = HandsEvaluator.high_card(hands[0], hands[1])
   # end
    winning_hand.name
  end

end
