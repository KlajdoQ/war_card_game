require_relative 'deck'

module WarCardGame
  class Game
    MAX_ROUNDS = 1000 # avoiding infinite loops - not in the rules 

    def initialize(player_names)
      @players = player_names.map.with_index do |name, idx|
        hand = Deck.new.deal(player_names.size)[idx]
        Player.new(name, hand)
      end
    end

    def play
      active = @players.dup
      rounds = 0

      # Continue until someone owns the whole deck or safeguard triggers.
      until rounds >= MAX_ROUNDS || (active.one? && active.first.count == 52)
        active.reject!(&:empty?)           # Rule 3 elimination
        break if active.size <= 1          # all but one eliminated mid‑round

        Round.new(active).play             # Rule 4 round execution
        active.reject!(&:empty?)
        rounds += 1
      end

      active.one? && active.first.count == 52 ? active.first : nil
    end
  end
end