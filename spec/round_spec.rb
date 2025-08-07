require 'war_card_game/round'
require 'war_card_game/player'
require 'war_card_game/card'

RSpec.describe WarCardGame::Round do
  it 'awards cards_in_play to the higher card player' do
    clyde = WarCardGame::Player.new('Clyde', [WarCardGame::Card.new('5')])
    tom = WarCardGame::Player.new('Tom', [WarCardGame::Card.new('3')])
    round = WarCardGame::Round.new([clyde, tom])
    winner = round.play
    expect(winner).to eq(clyde)
    expect(clyde.count).to eq(2)
    expect(tom.count).to eq(0)
  end

  context 'when there is a tie (war)' do
    it 'starts a war and awards all cards_in_play to eventual winner' do
      clyde = WarCardGame::Player.new('Clyde', [WarCardGame::Card.new('7'), WarCardGame::Card.new('2'), WarCardGame::Card.new('2'), WarCardGame::Card.new('K')])
      tom = WarCardGame::Player.new('Tom', [WarCardGame::Card.new('7'), WarCardGame::Card.new('3'), WarCardGame::Card.new('3'), WarCardGame::Card.new('Q')])
      round = WarCardGame::Round.new([clyde, tom])
      winner = round.play
      # Clyde and Tom each burn 3 cards, then compare K vs Q
      expect(winner).to eq(clyde)
      expect(clyde.count).to eq(8) # 4 initial + 4 war cards_in_play
      expect(tom.count).to eq(0)
    end
  end
end