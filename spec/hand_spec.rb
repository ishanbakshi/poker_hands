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

  end 
end
