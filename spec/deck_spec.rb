require_relative '../lib/war_card_game/deck'

RSpec.describe WarCardGame::Deck do
  subject(:deck) { described_class.new }

  describe '#initialize' do
    it 'creates 52 cards' do
      expect(deck.size).to eq(52)
    end

    it 'contains four of each rank' do
      counts = deck.instance_variable_get(:@cards).each_with_object(Hash.new(0)) { |card,h| h[card.rank] += 1 }
      WarCardGame::Card::RANKS.each do |rank|
        expect(counts[rank]).to eq(4)
      end
    end
  end

  describe '#deal' do
    it 'deals cards evenly for two players' do
      hands = deck.deal(2)
      expect(hands.size).to eq(2)
      expect(hands[0].size).to eq(26)
      expect(hands[1].size).to eq(26)
    end

    it 'deals cards evenly for four players' do
      hands = deck.deal(4)
      expect(hands.size).to eq(4)
      expect(hands.all? { |h| h.size == 13 }).to be true
    end
  end
end