require 'spec_helper'

describe 'HandsEvaluator' do
  
  it 'should return winning hand based on highest card' do
    black_hand = instance_double('Hand', highest_card: 'K')
    white_hand = instance_double('Hand', highest_card: 'A')
    winning_hand = HandsEvaluator.high_card(black_hand, white_hand)
    expect(winning_hand).to eq(white_hand)
  end

  it 'should return winning hand based on highest card' do
    black_hand = instance_double('Hand', highest_card: 'A')
    white_hand = instance_double('Hand', highest_card: '3')
    winning_hand = HandsEvaluator.high_card(black_hand, white_hand)
    expect(winning_hand).to eq(black_hand)
  end
end

describe 'pairEvaluator' do
  it 'should return black hand based on presence of pair' do
    black_hand = Hand.new("Black: 3S 4C 3D KS QH")
    white_hand = Hand.new("White: 5S 4C 3D KS QH")
    winning_hand = HandsEvaluator.card_with_pair(black_hand,white_hand)
    expect(winning_hand).to eq(black_hand)
  end

  it 'should return black hand based on presence of pair' do
    black_hand = Hand.new("Black: 3S 4C 7D KS QH")
    white_hand = Hand.new("White: 5S 4C 3D 4S QH")
    winning_hand = HandsEvaluator.card_with_pair(black_hand,white_hand)
    expect(winning_hand).to eq(white_hand)
  end
end

