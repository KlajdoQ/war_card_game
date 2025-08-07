require 'war_card_game/player'
require 'war_card_game/card'

RSpec.describe WarCardGame::Player do
  let(:cards) { [WarCardGame::Card.new('A'), WarCardGame::Card.new('K'), WarCardGame::Card.new('Q')] }
  subject { described_class.new('Clyde', cards) }

  describe '#initialize' do
    it 'sets name and initial hand' do
      expect(subject.name).to eq('Clyde')
      expect(subject.count).to eq(3)
    end
  end

  describe '#empty?' do
    it 'returns false when hand is not empty' do
      expect(subject.empty?).to be false
    end

    it 'returns true when hand is empty' do
      empty_player = described_class.new('Tom', [])
      expect(empty_player.empty?).to be true
    end
  end

  describe '#play_card' do
    it 'removes and returns the top card' do
      top = cards.first
      expect(subject.play_card).to eq(top)
      expect(subject.count).to eq(2)
    end
  end

  describe '#collect' do
    it 'adds cards to the bottom of the hand' do
      new_cards = [WarCardGame::Card.new('2'), WarCardGame::Card.new('3')]
      subject.collect(new_cards)
      expect(subject.count).to eq(5)
      expect(subject.hand.last(2)).to eq(new_cards)
    end
  end

  describe '#count' do
    it 'returns number of remaining cards' do
      expect(subject.count).to eq(3)
    end
  end
end