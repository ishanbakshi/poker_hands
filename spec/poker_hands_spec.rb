require 'spec_helper'

describe 'Poker Hands' do
  
  it 'should show correct winning hand' do
    poker_game = PokerGame.new
    expect(poker_game.winning_hand("Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH")).to include('White')
  end

end
