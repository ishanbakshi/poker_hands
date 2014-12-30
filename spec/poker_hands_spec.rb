require 'spec_helper'

describe 'Poker Hands' do

  describe 'integration' do

    it 'should work with highest card' do
      poker_game = PokerGame.new
      expect(poker_game.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")).to include('White')
      expect(poker_game.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C QH")).to include('Black')
    end

  end
  
  it 'should return correct winning hand' do
    poker_game = PokerGame.new
    black_hand = instance_double('Hand',  name: 'Black')
    white_hand = instance_double('Hand',  name: 'White')
    allow(HandsParser).to receive(:parse).and_return([black_hand, white_hand])
    allow(HandsEvaluator).to receive(:high_card).with(black_hand, white_hand).and_return(white_hand)
    expect(poker_game.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")).to include('White')
  #expect(poker_game.winning_hand("Black: 2H 3D 5S 6H 2H  White: 4H 2S 7H KH 2S")).to include('Black')
  end

end
