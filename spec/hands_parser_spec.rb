require 'spec_helper'

describe 'HandsParser' do
  
  it 'should return two hands' do
    hands = HandsParser.parse("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")
    expect(hands.length).to eq(2)
  end

  it 'should return hands of Hand object' do
    hands = HandsParser.parse("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")
    expect(hands[0].class).to eq(Hand)
    expect(hands[1].class).to eq(Hand)
  end

  it 'should initialise Hands with correct info' do
    expect(Hand).to receive(:new).with('Black: 2H 3D 5S 9C KD')
    expect(Hand).to receive(:new).with('White: 2C 3H 4S 8C AH')
    HandsParser.parse("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")
  end

end
