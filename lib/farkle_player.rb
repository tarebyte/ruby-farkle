# farkle_player.rb

class FarklePlayer

  # Public give every player attributes
  #
  # name - This is used for personalization
  # dice_cup - Every player gets a cup of 6 dice to begin with
  #
  #
  def initialize ( name )
    
    @name = name
    @dice_cup = Hash.new
    @current_score
    @total_score = 0

  end

  # Public start the player out with a clean slate
  #
  # dice_cup is give all new dice that are set to 0
  # current_score is set to 0
  #
  def start_turn

    @dice_cup = {
      :die1 => 0,
      :die2 => 0,
      :die3 => 0,
      :die4 => 0,
      :die5 => 0,
      :die6 => 0
    }

    @current_score = 0

  end

  # Public Every dice in @dice_cup gets a new value
  #
  # Example
  # => player1 = FarklePlayer.roll_dice
  #
  def roll_dice
    @dice_cup.each { |k, v| @dice_cup[k] = Random.rand(1..6) }
  end


end
