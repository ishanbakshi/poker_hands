class PokerGame

  def winning_hand(both_hands)
    hands = HandsParser.parse(both_hands) 
    hand_eval_obj = HandsEvaluator.new
    winning_hand_value = hand_eval_obj.card_with_straight_flush(hands[0], hands[1])
    if( winning_hand_value == false)
      winning_hand_value = hand_eval_obj.card_with_four_of_a_kind(hands[0], hands[1])
    end
    if( winning_hand_value == false)
      winning_hand_value = hand_eval_obj.card_with_full_house(hands[0], hands[1])
    end
    if( winning_hand_value == false)
      winning_hand_value = hand_eval_obj.card_with_flush(hands[0], hands[1])
    end
    if( winning_hand_value == false)
      winning_hand_value = hand_eval_obj.card_with_straight(hands[0], hands[1])
    end
    if(winning_hand_value == false)
    winning_hand_value = hand_eval_obj.card_with_triplet(hands[0], hands[1])
    end
    if(winning_hand_value == false)         
    winning_hand_value = hand_eval_obj.card_with_pair(hands[0], hands[1])
    end
    if(winning_hand_value == false)         
    winning_hand_value = HandsEvaluator.high_card(hands[0], hands[1])
    end
    winning_hand_value.name
   end

end
