# farkle_player.rb

class FarklePlayer

  # Public give every player attributes
  #
  # current_score - Name sort of explains it
  # dice_cup - Every player gets a cup of 6 dice to begin with
  # name - This is used for personalization
  # total_score - Score that player has for the whole game so far 
  #
  def initialize ( name )

    @current_score = 0
    
    @dice_cup = {
      :die1 => 0,
      :die2 => 0,
      :die3 => 0,
      :die4 => 0,
      :die5 => 0,
      :die6 => 0
    }
    
    @name = name
    @total_score = 0

  end

  # Public return what is in the cup
  # All Hash methods can be called on this method
  #
  def current_dice_cup
    @dice_cup
  end

  # Public returns the current players score as of this
  # turn
  #
  def current_score
    @current_score
  end

  # Public Every dice in @dice_cup gets a new value
  #
  def roll_dice
    @dice_cup.each { |k, v| @dice_cup[k] = Random.rand(1..6) }
  end

  # Public start the player out with a clean slate
  #
  # dice_cup is give all new dice that are set to 0
  # current_score is set to 0
  #
  def start_turn

    @dice_cup.each { |k,v| @dice_cup[k] = 0 }
    @current_score = 0

  end

  # Public returns the name of the current player
  #
  def name?
    @name
  end

end