# ../lib/ruby-farkle/farkle_player.rb
require_relative 'farkle_brain.rb'

class FarklePlayer < FarkleBrain

  # Public: Give every player attributes
  #
  def initialize(name)
    @name = name
  end

  # Public: give the user their choices so that
  # they can play the game
  #
  def options?
    self.run_all_options
  end
  # Public: List out all of the dice the user rolled
  #
  def print_cup
    self.to_s
  end

  # Public: For the number of dice the player has add newly
  # rolled dice to the cup
  #
  def roll_dice
    self.numer_of_dice.times { self.dice_cup << Random.rand(1..6) }
  end

  # Public: Start the player out with a clean slate
  # for their turn
  #
  def start_turn
    self.reset
    6.times { self.dice_cup << Random.rand(1..6) }
  end

end
