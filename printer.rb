class Printer

  attr_accessor :game

  def initialize(game)
    self.game = game
  end

  def welcome
    line
    puts "WELCOME TO THE RUBY CASINO, WHERE THE ONLY THING YOU CAN LOSE IS YOUR PRIDE."
    line
  end

  def initial_hands
    puts "\nDealer's hand: " + dealer_hand(:hide_second_card)
    puts "\nYour Hand: " + player_hand
    puts "\n"
  end

  def new_player_hand
    puts "\nYour new hand: " + player_hand
  end

  def player_hand
    game.player_hand.join(", ")
  end

  def dealer_hand(*options)
    if options.include? :hide_second_card
      game.dealer_hand.first + ", Hidden"
    else
      game.dealer_hand.join(", ")
    end
  end

  def line
    puts "==============================================================="
  end

  def decision
    puts "Hit or stay? (h/s)"
  end

  def stupid
    puts "Do you really have to try and break everything? h or s only buddy"
  end

end
