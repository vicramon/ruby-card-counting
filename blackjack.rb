require_relative 'printer'

class Blackjack

  CARD_TYPES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "K", "Q", "A"]

  def self.new_game
    Blackjack.new
  end

  attr_accessor :cards, :dealer_hand, :player_hand, :printer

  private

  def initialize
    self.printer = Printer.new(self)
    self.cards = CARD_TYPES * 4
    printer.welcome
    new_round
  end

  def new_round
    reset_hands
    shuffle
    2.times do
      draw_dealer_card
      draw_player_card
    end
    printer.initial_hands
    decision_prompt
  end

  def decision_prompt
    printer.decision
    move = gets
    move.strip!
    if move == "h"
      draw_player_card
      printer.new_player_hand
    elsif move == "s"
      wrap_up_game
    else
      printer.stupid
    end
  end

  def wrap_up_game

  end

  def reset_hands
    self.dealer_hand = []
    self.player_hand = []
  end

  def draw_dealer_card
    self.dealer_hand << cards.pop
  end

  def draw_player_card
    self.player_hand << cards.pop
  end

  def shuffle
    self.cards.shuffle!
  end

end

Blackjack.new_game
