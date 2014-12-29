require 'spec_helper'

describe 'HandsEvaluator' do
  
  it 'should return winning hand based on highest card' do
    black_hand = instance_double('Hand', highest_card: 'K')
    white_hand = instance_double('Hand', highest_card: 'A')
    winning_hand = HandsEvaluator.winning_hand(black_hand, white_hand)
    expect(winning_hand).to eq(white_hand)
  end

  it 'should return winning hand based on highest card' do
    black_hand = instance_double('Hand', highest_card: 'A')
    white_hand = instance_double('Hand', highest_card: '3')
    winning_hand = HandsEvaluator.winning_hand(black_hand, white_hand)
    expect(winning_hand).to eq(black_hand)
  end
end
