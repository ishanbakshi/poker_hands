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
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_pair(black_hand,white_hand)
    expect(winning_hand).to eq(black_hand)
  end

  it 'should return black hand based on presence of pair' do
    black_hand = Hand.new("Black: 3S 4C 7D KS QH")
    white_hand = Hand.new("White: 5S 4C 3D 4S QH")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_pair(black_hand,white_hand)
    expect(winning_hand).to eq(white_hand)
  end

  it 'should return no_pair in the absence of no pairs in both hands' do
    black_hand = Hand.new("Black: 3S 4C 7D KS QH")
    white_hand = Hand.new("White: 5S 4C 3D 2S QH")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_pair(black_hand,white_hand)
    expect(winning_hand).to eq(false)
  end
  it 'should return white hand based on presence of larger pair' do
    black_hand = Hand.new("Black: 3S 4C 7D 4S QH")
    white_hand = Hand.new("White: 5S 4C 3D QS QH")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_pair(black_hand,white_hand)
    expect(winning_hand).to eq(white_hand)
  end
  it 'should return white hand based on presence of second pair' do
    black_hand = Hand.new("Black: 3S 4C 7D QS QH")
    white_hand = Hand.new("White: 5S 4C 5D QS QH")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_pair(black_hand,white_hand)
    expect(winning_hand).to eq(white_hand)
  end
  it 'should return black hand based on presence of larger second pair' do
    black_hand = Hand.new("Black: JS 4C QD JS QH")
    white_hand = Hand.new("White: 5S 4C 5D QS QH")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_pair(black_hand,white_hand)
    expect(winning_hand).to eq(black_hand)
  end

end
describe 'three of a kind evaluator' do
  it 'should return black hand based on presence of 3 of a kind' do
    black_hand = Hand.new("Black: JS 4C JD JS QH")
    white_hand = Hand.new("White: 5S 4C 5D QS QH")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_triplet(black_hand,white_hand)
    expect(winning_hand).to eq(black_hand)
  end
end

describe 'straight series of 5 consecutive cards' do
  it 'should return white hand based on 5 consecutive cards' do
    black_hand = Hand.new("Black: 7S 8C 9D JS QH")
    white_hand = Hand.new("White: 5S 4C 5D QS QH")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_straight(black_hand,white_hand)
    expect(winning_hand).to eq(black_hand)
  end
  it 'should return white hand based on hand with larger 5 consecutive cards' do
    black_hand = Hand.new("Black: 7S 8C 9D JS QH")
    white_hand = Hand.new("White: 4S 5C 6D 7S 8H")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_straight(black_hand,white_hand)
    expect(winning_hand).to eq(black_hand)
  end
end

describe 'flush' do
  it 'should return white hand based on the rule of flush' do
    black_hand = Hand.new("Black: 7D 8D 9D JD QD")
    white_hand = Hand.new("White: 4S 5C 6D 7S 8H")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_flush(black_hand,white_hand)
    expect(winning_hand).to eq(black_hand)
  end

  it 'should return white hand based on the rule of flush with highest card' do
    black_hand = Hand.new("Black: 7D 8D 9D JD QD")
    white_hand = Hand.new("White: 4S 5S 6S 7S AS")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_flush(black_hand,white_hand)
    expect(winning_hand).to eq(white_hand)
  end
end

describe 'full house' do
  it 'should return black hand based on full house' do
    black_hand = Hand.new("Black: 7D 9D 7D 9D 9D")
    white_hand = Hand.new("White: 4S 5S 6S 7S AS")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_full_house(black_hand,white_hand)
    expect(winning_hand).to eq(black_hand)
  end
  it 'should return white hand based on full house with higher triplet' do
    black_hand = Hand.new("Black: 7D 9D 7D 9D 9D")
    white_hand = Hand.new("White: 4S KS KS 4S KS")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_full_house(black_hand,white_hand)
    expect(winning_hand).to eq(white_hand)
  end
end

describe 'four of a kind' do
  it 'should return white hand based on four of a kind' do
    black_hand = Hand.new("Black: 7D 9D 7D 9D 9D")
    white_hand = Hand.new("White: 4S 4S 6S 4S 4S")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_four_of_a_kind(black_hand,white_hand)
    expect(winning_hand).to eq(white_hand)
  end
  it 'should return white hand based on four of a kind with higher card' do
    black_hand = Hand.new("Black: 2D 2D 2D 2D 9D")
    white_hand = Hand.new("White: 4S 4S 6S 4S 4S")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_four_of_a_kind(black_hand,white_hand)
    expect(winning_hand).to eq(white_hand)
  end
end

describe 'straight flush' do
  it 'should return white hand based on straight flush' do
    black_hand = Hand.new("Black: 2D 3D 4D 5D 6D")
    white_hand = Hand.new("White: 4S 4S 6S 4S 4S")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_straight_flush(black_hand,white_hand)
    expect(winning_hand).to eq(black_hand)
  end
  it 'should return white hand based on straight flush with higher series' do
    black_hand = Hand.new("Black: 2D 3D 4D 5D 6D")
    white_hand = Hand.new("White: 7S 8S 9S JS QS")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_straight_flush(black_hand,white_hand)
    expect(winning_hand).to eq(white_hand)
  end
  it 'should return false based on absence straight flush' do
    black_hand = Hand.new("Black: 2D 3D 4H 5D 6D")
    white_hand = Hand.new("White: 7S 8S 2S JS QS")
    hands_evaluator_obj = HandsEvaluator.new
    winning_hand = hands_evaluator_obj.card_with_straight_flush(black_hand,white_hand)
    expect(winning_hand).to eq(false)
  end
end

