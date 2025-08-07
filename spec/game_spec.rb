require 'war_card_game/game'

RSpec.describe WarCardGame::Game do
    it 'declares a winner with the full deck' do
    allow_any_instance_of(WarCardGame::Deck).to receive(:deal).and_return([
        Array.new(26) { WarCardGame::Card.new('A') },   # Clyde: all aces
        Array.new(26) { WarCardGame::Card.new('2') }    # Tom: all twos
    ])

    winner = described_class.new(%w[Clyde Tom]).play
    expect(winner).to be_a(WarCardGame::Player)
    expect(winner.count).to eq(52)
    end

  it 'supports four-player games' do
    allow_any_instance_of(WarCardGame::Deck).to receive(:deal).and_return([
      (1..13).map { WarCardGame::Card.new('A') },
      (1..13).map { WarCardGame::Card.new('K') },
      (1..13).map { WarCardGame::Card.new('Q') },
      (1..13).map { WarCardGame::Card.new('J') }
    ])
    game = described_class.new(%w[A B C D])
    winner = game.play
    expect(%w[A B C D]).to include(winner.name)
    expect(winner.count).to eq(52)
  end

  it 'returns nil when max rounds reached (stalemate)' do
  stub_const('WarCardGame::Game::MAX_ROUNDS', 1)

  allow_any_instance_of(WarCardGame::Deck).to receive(:deal).and_return([
    [WarCardGame::Card.new('A')],
    [WarCardGame::Card.new('A')]
  ])

  game = described_class.new(%w[Clyde Tom])
  expect(game.play).to be_nil
  end     
end