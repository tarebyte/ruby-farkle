# ruby-farkle/farkle_player.rb

class FarklePlayer

  # Public: Give every player attributes
  #
  # current_score - Name sort of explains it
  # dice_cup - Every player gets a cup of 6 dice to begin with
  # name - This is used for personalization
  # total_score - Score that player has for the whole game so far 
  #
  # Example
  #
  #  player1 = FarklePlayer.new "Mark"
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

    @farkle_count = 0
    @name = name
    @total_score = 0

  end

  # Public: Return what is in the cup
  # All Hash methods can be called on this method
  #
  def current_dice_cup
    @dice_cup
  end

  # Public: Returns the how many farkles the player has
  #
  def current_farkle_count
    @farkle_count
  end

  # Public: Returns the current players score as of this
  # turn
  #
  def current_score
    @current_score
  end

  # Public: Pulls of all of the single scoring dice
  # from the cup and adds them to the current score
  #
  # Can only be a 1 or 5
  # Each 1 gets you 100 points
  # Each 5 gets you  50 points
  #
  def get_all_single_scoring_dice

    @dice_cup.each do |k, v|

      case @dice_cup[k]
      when 1
        @current_score += 100
      when 5
        @current_score += 50
      end

    end

    # I want to refactor this to one statement but for some reason it won't
    # delete them all, all of the time
    #
    @dice_cup.delete_if { |k, v| @dice_cup[k] == 1 }
    @dice_cup.delete_if { |k, v| @dice_cup[k] == 5 }

  end

  # Public: Every dice in @dice_cup gets a new value
  #
  def roll_dice
    @dice_cup.each { |k, v| @dice_cup[k] = Random.rand(1..6) }
  end

  # Public: Start the player out with a clean slate
  #
  # current_score is set to 0
  # dice_cup is give all new dice that are set to 0
  # farkle count is set to 0
  #
  def start_turn

    @current_score = 0
    @dice_cup.each { |k,v| @dice_cup[k] = 0 }
    @farkle_count = 0

  end

  # Public returns the name of the current player
  #
  def name?
    @name
  end

end

