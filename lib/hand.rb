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
      if hand_parts[0..(counter-1)].include? hand_parts[counter]
        return hand_parts[counter]
      end
      counter -=1
    end
    "no_pair"
  end
end
