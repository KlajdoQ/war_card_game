require_relative 'card'

module WarCardGame
  class Player
    attr_reader :name, :hand

    def initialize(name, hand = [])
      @name = name
      @hand = hand.dup
    end

    # Rule 3: a player is eliminated when `empty?` becomes true.
    def empty? 
         hand.empty?
    end

    def play_card
        hand.shift
    end

    def collect(cards)
        hand.concat(cards)
    end

    def count
        hand.size
    end
  end
end