class Hand

  def initialize(hand_string)
    @hand_string = hand_string
  end

  def name 
    @hand_string.split(" ")[0].gsub(":","")
  end

  def highest_card
    hand_parts = @hand_string.split(" ")[1,5].map{|element| element[0]}
    hand_parts.sort_by{|card_symbol| Card.value(card_symbol)}.last
  end

  def pair 
    hand_parts = @hand_string.split(" ")[1,5].map{|element| element[0]} 
    hand_parts.sort_by{|card_symbol| Card.value(card_symbol)}
    counter = 4
    while counter > 0
      #if hand_parts[0..(counter-1)].include? hand_parts[counter]
      if hand_parts[0..(counter-1)].select{ |a| a == hand_parts[counter] }.count == 1
        return hand_parts[counter]
      end
      counter -=1
    end
    "no_pair"
  end

  def second_pair
    hand_parts = @hand_string.split(" ")[1,5].map{|element| element[0]} 
    hand_parts.sort_by{|card_symbol| Card.value(card_symbol)}
    hand_parts.delete(self.pair.to_s)
    counter = 2
    while counter > 0
      if hand_parts[0..(counter-1)].include? hand_parts[counter]
        return hand_parts[counter]
      end
      counter -=1
    end
    "no_pair"
  end

  def three_of_a_kind
    hand_parts = @hand_string.split(" ")[1,5].map{|element| element[0]} 
    hand_parts.sort_by{|card_symbol| Card.value(card_symbol)}
    counter = 4
    while counter > 1
     if hand_parts[0..(counter-1)].select{ |a| a == hand_parts[counter] }.count == 2
       return hand_parts[counter] 
     end
     counter -=1
    end
    false
  end

  def card_series
    hand_parts = @hand_string.split(" ")[1,5].map{|element| element[0]} 
    hand_parts.sort_by{|card_symbol| Card.value(card_symbol)}
    counter = 4
    series_starter = hand_parts.last
    while counter > 0
      register = Card.value(hand_parts.pop) - 1
      if register != Card.value(hand_parts.last)
         return false
      end
      counter -=1
    end
    return series_starter
  end

  def flush
    hand_parts = @hand_string.split(" ")[1,5].map{|element| element[1]} 
    single_card_part = hand_parts.last
    if hand_parts.select{|ele| ele == single_card_part}.length == 5
      hand_parts.last
    else
      false
    end
  end

  def full_house
    if self.three_of_a_kind
      hand_parts = @hand_string.split(" ")[1,5].map{|element| element[0]} 
      hand_parts = hand_parts.select { |ele| ele != self.three_of_a_kind }
      if hand_parts.last == hand_parts.first
        self.three_of_a_kind
      else
        false
      end
    else
      false
    end 
  end

  def four_of_a_kind
    hand_parts = @hand_string.split(" ")[1,5].map{|element| element[0]} 
    hand_parts.sort_by{|card_symbol| Card.value(card_symbol)}
    counter = 4
    while counter > 2
     if hand_parts[0..(counter-1)].select{ |a| a == hand_parts[counter] }.count == 3
       return hand_parts[counter] 
     end
     counter -=1
    end
    false
  end

end

