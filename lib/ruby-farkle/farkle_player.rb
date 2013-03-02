# ../lib/ruby-farkle/farkle_player.rb
require_relative 'farkle_moves.rb'

class FarklePlayer < FarkleMoves

  # Public: Give every player attributes
  #
  # Example
  #
  #  player1 = FarklePlayer.new "Mark"
  #
  def initialize( name )
    @name = name
  end

  # Public: Lets the user know if there are sets of three
  #
  def set_of_three?
    self.get_all_sets_of_three != nil ? true : false
  end

  # Public: Returns whether there are any single scoring dice
  #
  def single_scoring_dice?

    if !self.set_of_three?
      ( @dice_cup.include?(1) || @dice_cup.include?(5) )
    else
      false
    end

  end

  # Public: List out all of the dice the user rolled
  #
  def in_cup?
    @dice_cup.each { |value| print "#{value} "}
  end

  # Public: For the number of dice the player has add newly
  # rolled dice to the cup
  #
  def roll_dice
    self.number_of_dice.times { self.dice_cup << Random.rand(1..6) }
  end

  # Public: Start the player out with a clean slate
  # for their turn
  #
  def start_turn

    self.current_score = 0
    self.number_of_dice = 6
    self.farkle_count = 0
  end

end
