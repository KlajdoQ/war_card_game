require_relative 'card'
require_relative 'player'

module WarCardGame
  class Round
    attr_reader :cards_in_play

    def initialize(players)
      @players = players.dup   # active players this round
      @cards_in_play  = []            # cards at stake
    end

    def play 
        battle(@players) # returns the winning Player (or nil if no winner)
    end

    private

    # Rule 4C war logic.
    def battle(active_payers)
      active_payers.reject!(&:empty?)          # Rule 3: eliminate empty‑hand players
      return nil if active_payers.empty?
      return active_payers.first if active_payers.one?

      face_up = {}
      active_payers.each do |p|
        card = p.play_card                 # Rule 4A: face‑up card
        next unless card                   # ran out mid‑round (Rule 4D)
        face_up[p] = card
        cards_in_play << card
      end

      return award_to(face_up.keys.first) if face_up.size == 1

      max_card = face_up.values.max
      tied = face_up.select { |_p, c| c == max_card }.keys

      if tied.size > 1                      # Rule 4C: war scenario
        tied.each do |p|
          3.times do                        # three face‑down burns
            break if p.count <= 1          # Rule 4D: keep last for face‑up
            cards_in_play << p.play_card          # face‑down → added to cards_in_play
          end
        end
        return battle(tied)                # recurse only with tied players
      end

      award_to(tied.first)                  # Rule 4B: highest wins cards_in_play
    end

    def award_to(winner)
    return nil unless winner
      winner.collect(cards_in_play.shift(cards_in_play.size))
      winner
    end
  end
end