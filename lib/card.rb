class Card
        
  def self.value(symbol)
    return 13 if symbol == 'A'
    return 12 if symbol == 'K'
    return 11 if symbol == 'Q'
    return 10 if symbol == 'J'
    return symbol.to_i
  end

end
