require_relative 'card'

module WarCardGame
  class Deck
    def initialize
      # Rule 1: a standard 52‑card deck (4 of each rank).
      @cards = Card::RANKS.flat_map { |rank| Array.new(4) { Card.new(rank) } }.shuffle
    end

    # Rule 1: deal the deck *evenly* amongst 2 or 4 players.
    def deal(num_players)
      hands = Array.new(num_players) { [] }
      @cards.each_with_index { |card, idx| hands[idx % num_players] << card }
      hands
    end

    def size
      @cards.size
    end
  end

end