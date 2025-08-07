require_relative 'card'

module WarCardGame
  # Card represents a single playing‑card with a rank only (suits irrelevant).
  #   – Rule 5/6: ace is high, suits don’t matter.
  class Card
    include Comparable

    # Ordered from lowest to highest per Rule 5/6.
    RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

    attr_reader :rank

    def initialize(rank)
      @rank = rank
    end

    # higher rank wins (Rule 4B).
    def <=>(other)
      RANKS.index(rank) <=> RANKS.index(other.rank)
    end

    def to_s 
      rank
    end
  end
end