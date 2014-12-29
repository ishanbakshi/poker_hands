class HandsParser

  def self.parse(hands_string)
    hand_parts = hands_string.split(" ")
    first_hand = hand_parts[0,6].join(" ")
    second_hand = hand_parts[6,11].join(" ")
    [Hand.new(first_hand), Hand.new(second_hand)]
  end

end
