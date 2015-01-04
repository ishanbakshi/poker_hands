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

  public

  def card_with_triplet(black_hand, white_hand)
    if black_hand.three_of_a_kind != false && white_hand.three_of_a_kind !=false
      if black_hand.three_of_a_kind == white_hand.three_of_a_kind
        false
      elsif black_hand.three_of_a_kind > white_hand.three_of_a_kind
        black_hand 
      else
        white_hand
      end
    elsif black_hand.three_of_a_kind !=false
      black_hand
    elsif white_hand.three_of_a_kind != false
      white_hand
    else
      false
    end
  end

  def card_with_straight(black_hand, white_hand)
    if black_hand.card_series != false && white_hand.card_series
     if black_hand.card_series == white_hand.card_series
       false
     elsif black_hand.card_series > white_hand.card_series
       black_hand    
     else
       white_hand
     end
    elsif black_hand.card_series != false
      black_hand
    elsif white_hand.card_series != false
      white_hand
    else
      false
    end       
  end

  def card_with_flush(black_hand, white_hand)
    if black_hand.flush != false && white_hand.flush != false
     if black_hand.flush == white_hand.flush
       false
     elsif black_hand.flush > white_hand.flush
       black_hand    
     else
       white_hand
     end
    elsif black_hand.flush != false
      black_hand
    elsif white_hand.flush != false
      white_hand
    else
      false
    end       
  end

  def card_with_full_house(black_hand, white_hand)
    if black_hand.full_house != false && white_hand.full_house != false
     if black_hand.full_house == white_hand.full_house
       false
     elsif black_hand.full_house > white_hand.full_house
       black_hand    
     else
       white_hand
     end
    elsif black_hand.full_house != false
      black_hand
    elsif white_hand.full_house != false
      white_hand
    else
      false
    end       
  end

  def card_with_four_of_a_kind(black_hand,white_hand)
    if black_hand.four_of_a_kind != false && white_hand.four_of_a_kind != false
     if black_hand.four_of_a_kind == white_hand.four_of_a_kind
       false
     elsif black_hand.four_of_a_kind > white_hand.four_of_a_kind
       black_hand    
     else
       white_hand
     end
    elsif black_hand.four_of_a_kind != false
      black_hand
    elsif white_hand.four_of_a_kind != false
      white_hand
    else
      false
    end       
  end

  def card_with_straight_flush(black_hand,white_hand)
    if black_hand.straight_flush != false && white_hand.straight_flush != false
     if black_hand.straight_flush == white_hand.straight_flush
       false
     elsif black_hand.straight_flush > white_hand.straight_flush
       black_hand    
     else
       white_hand
     end
    elsif black_hand.straight_flush != false
      black_hand
    elsif white_hand.straight_flush != false
      white_hand
    else
      false
    end       
  end

end
