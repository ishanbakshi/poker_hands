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

  def card_with_pair(black_hand,white_hand)
    if black_hand.pair != "no_pair" && white_hand.pair !="no_pair"
        if black_hand.pair > white_hand.pair
          black_hand
        elsif black_hand.pair == white_hand.pair
          second_pair_check(black_hand,white_hand)
        else
         white_hand
        end
    elsif white_hand.pair != "no_pair"
      white_hand
    elsif black_hand.pair != "no_pair"
      black_hand
    else 
      false
    end    
  end
  
  protected
  def second_pair_check(black_hand,white_hand)
    if black_hand.second_pair != "no_pair" && white_hand.second_pair != "no_pair"
      if black_hand.second_pair > white_hand.second_pair
          return black_hand
      elsif black_hand.second_pair < white_hand.second_pair
          return white_hand
      else
           return "no_pair"
      end   
    elsif black_hand.second_pair != "no_pair"
      return black_hand
    elsif white_hand.second_pair != "no_pair"
      return white_hand
    else
      "no_pair"
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
