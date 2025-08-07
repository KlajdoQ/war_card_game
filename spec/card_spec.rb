require 'war_card_game/card'

RSpec.describe WarCardGame::Card do
  describe '#initialize' do
    it 'sets the rank' do
      card = described_class.new('5')
      expect(card.rank).to eq('5')
    end
  end

  describe 'comparison operators' do
    let(:low)  { described_class.new('2') }
    let(:mid)  { described_class.new('8') }
    let(:high) { described_class.new('A') }

    it 'sorts by rank value' do
      expect([mid, low, high].sort).to eq([low, mid, high])
    end

    it 'uses > and < correctly' do
      expect(high > mid).to be true
      expect(low < mid).to be true
    end
  end

  describe '#to_s' do
    it 'returns the rank as a string' do
      expect(described_class.new('Q').to_s).to eq('Q')
    end
  end
end