require 'spec_helper'

describe 'Poker Hands' do
  
  it 'should return correct winning hand' do
    poker_game = PokerGame.new
    black_hand = instance_double('Hand',  name: 'Black')
    white_hand = instance_double('Hand',  name: 'White')
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:winning_hand).with(black_hand, white_hand).and_return(white_hand)
    expect(poker_game.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")).to include('White')
  end

end
