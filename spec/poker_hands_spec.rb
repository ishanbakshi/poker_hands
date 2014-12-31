require 'spec_helper'
describe 'Poker Hands' do

=begin
  describe 'integration' do

    it 'should work with highest card' do
      poker_game = PokerGame.new
      expect(poker_game.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")).to include('White')
      expect(poker_game.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C QH")).to include('Black')
    end

  end
=end
  it 'should return winning hand with highest card' do
    poker_game = PokerGame.new
    black_hand = instance_double('Hand',  name: 'Black',pair: 'no_pair')
    white_hand = instance_double('Hand',  name: 'White',pair: 'no_pair')
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
   # allow(HandsEvaluator).to receive(:card_with_pair).with(black_hand, white_hand).and_return(black_hand)
   allow(HandsEvaluator).to receive(:high_card).with(black_hand, white_hand).and_return(white_hand)
    expect(poker_game.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")).to eq('White')
 #expect(poker_game.winning_hand("Black: 2H 3D 5S 6H 2D  White: 4H 2S 7H KH 2S")).to eq('Black')
  end

  it 'should return winning hand with a pair' do
    poker_game = PokerGame.new
    black_hand = instance_double('Hand',  name: 'Black', pair: '2')
    white_hand = instance_double('Hand',  name: 'White', pair: 'no_pair')
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:card_with_pair).with(black_hand, white_hand).and_return(black_hand)
   # allow(HandsEvaluator).to receive(:high_card).with(black_hand, white_hand).and_return(white_hand)
#    expect(PokerGame.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")).to eq('White')
 expect(poker_game.winning_hand("Black: 2H 3D 5S 6H 2D  White: 4H 2S 7H KH 2S")).to eq('Black')
  end
end
