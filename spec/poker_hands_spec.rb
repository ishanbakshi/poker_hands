require 'spec_helper'
describe 'Poker Hands' do

  describe 'integration' do

    it 'should work with highest card' do
      poker_game = PokerGame.new
      expect(poker_game.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")).to include('White')
      expect(poker_game.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C QH")).to include('Black')
      expect(poker_game.winning_hand("Black: 2H 3D 2S 9C KD  White: 2C 3H 4S 8C QH")).to include('Black')
      expect(poker_game.winning_hand("Black: 2H 3D 5S 9C 5D  White: 2C KH 4S 8C KH")).to include('White')
    end
  end
  it 'should return winning hand with highest card' do
    poker_game = PokerGame.new
    black_hand = Hand.new("Black: 2H 3D 5S 9C KD")
    white_hand = Hand.new("White: 2C 3H 4S 8C AH")
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
   allow(HandsEvaluator).to receive(:high_card).with(black_hand, white_hand).and_return(white_hand)
    expect(poker_game.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")).to eq('White')
  end

  it 'should return winning hand with a pair' do
    poker_game = PokerGame.new
    black_hand = Hand.new("Black: 2H 3D 5S 6C 2D")
    white_hand = Hand.new("Black: 4H JS 7H KH 2S")
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:card_with_pair).with(black_hand, white_hand).and_return(black_hand)
 expect(poker_game.winning_hand("Black: 2H 3D 5S 6H 2D  White: 4H JS 7H KH 2S")).to eq('Black')
  end

  it 'should return winning hand with a double pair' do
    poker_game = PokerGame.new
    black_hand = Hand.new("Black: 2H 2D 5S 4H 4D")
    white_hand = Hand.new("White: 4H 2S 7H KH 2S")
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:card_with_pair).with(black_hand, white_hand).and_return(black_hand)
 expect(poker_game.winning_hand("Black: 2H 2D 5S 4H 4D  White: 4H 2S 7H KH 2S")).to eq('Black')
  end

  it 'should return winning hand with higher pair' do
    poker_game = PokerGame.new
    black_hand = Hand.new("Black: 2H 3D 5S 6H 2D")
    white_hand = Hand.new("White: 4H JS 7H JH 2S")
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:card_with_pair).with(black_hand, white_hand).and_return(black_hand)
 expect(poker_game.winning_hand("Black: 2H 3D 5S 6H 2D  White: 4H JS 7H JH 2S")).to eq('White')
  end

  it ' should return winning hand with three of a kind' do
    poker_game = PokerGame.new
    black_hand = Hand.new("Black: 2H 5D 5S 6H 5D")
    white_hand = Hand.new("White: 4H JS 7H JH 2S")
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:card_with_pair).with(black_hand, white_hand).and_return(black_hand)
 expect(poker_game.winning_hand("Black: 2H 5D 5S 6H 5D  White: 4H JS 7H JH 2S")).to eq('Black')
  end

  it ' should return winning hand with 5 consecutive cards' do
    poker_game = PokerGame.new
    black_hand = Hand.new("Black: 2S 3S 4D 5D 6C") 
    white_hand  = Hand.new("Black: 2S 3S 2D 5D 6C")
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:card_with_straight).with(black_hand, white_hand).and_return(black_hand)
 expect(poker_game.winning_hand("Black: 2H 5D 5S 6H 5D  White: 4H JS 7H JH 2S")).to eq('Black')
  end

  it 'should return hand with flush' do
    poker_game = PokerGame.new
    black_hand = Hand.new("Black: 3D 2D 5D QD 8D")
    white_hand = Hand.new("White: 2S 5D AS AD AH")
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:card_with_flush).with(black_hand, white_hand).and_return(black_hand)
 expect(poker_game.winning_hand("Black: 3D 2D 5D QD 8D  White: 2S 5D AS AD AH")).to eq('Black') 
  end

  it 'should return hand with full house' do
    poker_game = PokerGame.new
    black_hand = Hand.new("Black: 3D QD 3D QD QD")
    white_hand = Hand.new("White: 2S 5D AS AD AH")
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:card_with_full_house).with(black_hand, white_hand).and_return(black_hand)
 expect(poker_game.winning_hand("Black: 3D QD 3D QD QD  White: 2S 5D AS AD AH")).to eq('Black')  
  end
   

  it 'should return hand with four of a kind' do
    poker_game = PokerGame.new
    black_hand = Hand.new("Black: 3D 2C 2H 2D 2S")
    white_hand = Hand.new("White: AS QD QS QD AH")
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:card_with_full_house).with(black_hand, white_hand).and_return(black_hand)
 expect(poker_game.winning_hand("Black: 3D 2C 2H 2D 2S  White: AS QD QS QD AH")).to eq('Black')  
  end


  it 'should return hand with a  straight flush' do
    poker_game = PokerGame.new
    black_hand = Hand.new("Black: 4D 5D 6D 7D 8D")
    white_hand = Hand.new("White: AS QD QS QD QH")
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:card_with_full_house).with(black_hand, white_hand).and_return(black_hand)
 expect(poker_game.winning_hand("Black: 4D 5D 6D 7D 8D  White: AS QD QS QD QH")).to eq('Black')  
  end

end
