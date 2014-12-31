class PokerGame

  def winning_hand(both_hands)
    hands = HandsParser.parse(both_hands) 
    hand_eval_obj = HandsEvaluator.new
    winning_hand_value = hand_eval_obj.card_with_pair(hands[0], hands[1])
  if(winning_hand_value == false)         
      winning_hand_value = HandsEvaluator.high_card(hands[0], hands[1])
  end
      winning_hand_value.name
   # end
   end

end
