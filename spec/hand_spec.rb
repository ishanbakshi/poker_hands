require 'spec_helper'

describe 'Hand' do

  describe 'highest card' do

    it 'should return highest card when its a king' do
      hand = Hand.new("Black: 5S 4C 3D KS QH")
      expect(hand.highest_card).to eq('K')
    end

    it 'should return highest card when its an Ace' do
      hand = Hand.new("Black: 5S 4C 3D KS AH")
      expect(hand.highest_card).to eq('A')
    end

  end

  describe 'name' do

    it 'should return hand name' do
      hand = Hand.new("Black: 5S 4C 3D KS AH")
      expect(hand.name).to eq("Black")
    end

  end
 
  describe 'pair' do
    
    it 'should return double pair' do
      hand = Hand.new("Black: 5S 4C 3D KS 5H")
      expect(hand.pair).to eq("5")
    end
    
    it 'should return second double pair' do
      hand = Hand.new("White: 4S 2S 4D 8S 8D")
      expect(hand.second_pair).to eq("4")
    end
  end 
  
  describe 'three of a kind'  do
    it 'should return three of a kind' do
      hand = Hand.new("White: 3S 6D 6S 6C 7D")
      expect(hand.three_of_a_kind).to eq("6")
    end
  end
  
  describe 'straight hands' do
    it 'should return the start of a 5 card consecutive series in a hand' do
      hand = Hand.new("White: 6S 7D 8S 9C JD")
      expect(hand.card_series).to eq("J")
    end
    it 'should return false if a 5 card series is not there' do
      hand = Hand.new("White: 3S 6D 6S 6C 7D")
      expect(hand.card_series).to eq(false)
    end
  end

  describe 'flush' do
    it 'should return haighest card of a hand which satisfies flush rule' do
      hand = Hand.new("Black: 3S 4S JS 2S AS")
      expect(hand.flush).to eq("S")
    end
    it 'should return false if flush rule is not satisfied for a hand' do
      hand = Hand.new("Black: 3S 4D JS 2S AS")
      expect(hand.flush).to eq(false)
    end
  end

  describe 'full house' do
    it 'should return highest card of triplet in full house' do
      hand = Hand.new("Black: 2S JD 2D JS JH")
      expect(hand.full_house).to eq("J")
    end
    it 'should return false if full house does not exist' do
      hand = Hand.new("White: 2S 5D AS AD AH")
      expect(hand.full_house).to eq(false)
    end
  end

  describe 'four of a kind' do
    it 'should return four of a kind' do
      hand = Hand.new("Black: 2S 3S 2D 2H 2C")
      expect(hand.four_of_a_kind).to eq("2")
    end
    it 'should return false if four of a kind does not exist' do
      hand = Hand.new("Black: 2S 3S 2D JH 2C")
      expect(hand.four_of_a_kind).to eq(false)
    end
  end

  describe 'straight flush' do
    it 'should return highest card of a straight flush' do
      hand = Hand.new("Black: 2H 3H 4H 5H 6H ")
      expect(hand.straight_flush).to eq("6")
    end
    it 'should false if a straight flush does not exist' do
      hand = Hand.new("Black: 2H 3H 4D 5H 6H ")
      expect(hand.straight_flush).to eq(false)
    end
  end


end
