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
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 0,
      5 => 0,
      6 => 0
    }

    @farkle_count = 0
    @name = name
    @total_score = 0

  end

  # Public: Lets the use know if there are sets of three
  #
  # Returns true if there are any sets if not it returns false
  #
  def are_there_any_three_or_more_sets?

    if self.get_all_three_of_a_kind_or_more != nil
      true
    else
      false
    end

  end

  # Public: Returns whether there are any single scoring dice
  #
  def are_there_any_single_scoring_dice?

    if !self.are_there_any_three_or_more_sets?
      ( @dice_cup.has_value?(1) || @dice_cup.has_value?(5) )
    else 
      false
    end

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
  def collect_all_single_scoring_dice

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

  # Public: Remove all three of a kinds 
  # and add them to the current score
  #
  # Returns nil if nothing was removed
  #
  def collect_all_three_of_a_kind

    three_or_more = self.get_all_three_of_a_kind_or_more

    if three_or_more != nil

      three_or_more.each do |three_value|

        if three_value == 1 # secial case because three 1's get you 1000 points
          @current_score += 1000
        else
          @current_score += ( three_value * 100 )
        end

        3.times do
          @dice_cup.delete_if {|k, v| v == three_value }
        end

      end

    else
      nil

    end

  end

  # Public: Collect a single scoring die that the user chooses
  #
  def collect_single_scoring_die ( die )

    if @dice_cup.has_value?(die)

      if die == 1
        @current_score += 100
      else
        @current_score += 50
      end

      key = 1
      while @dice_cup.length != (@dice_cup.length - 1) do
        @dice_cup.delete(key) if @dice_cup[key] == die
        key += 1
      end

    else
      nil
    end

  end

  # Public: Check is the user farkled, and if so add 1 to there farkle count
  #
  # Return true is found otherwise false
  def farkle?

    if !self.are_there_any_three_or_more_sets? && !self.are_there_any_single_scoring_dice? 
      @farkle_count += 1
      @current_score = 0
      true
    else
      false
    end

  end

  # Public: Tests if the player has 3 of a kind in their cup
  #
  # Returns all of the numbers that have three of a kind or more
  # or nil if there wasn't anything
  #
  def get_all_three_of_a_kind_or_more

    three_of_a_kind_or_more = []

    dice_point_total = {
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 0,
      5 => 0,
      6 => 0
    }

    # Since the keys and the values are of the same type
    # I can put in the value in place of the key value
    # and increment by one
    @dice_cup.each_value { |value| dice_point_total[value] += 1 }

    dice_point_total.each { |k, v| three_of_a_kind_or_more << k if v >= 3 }

    if three_of_a_kind_or_more.length > 0
      three_of_a_kind_or_more
    else
      nil
    end

  end

  # Public: List out all of the dice the user rolled
  #
  def list_dice_in_cup
    @dice_cup.each_value { |value| print "#{value} "}
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

  # Public: Returns the players total score
  #
  def total_score
    @total_score
  end

  # Public returns the name of the current player
  #
  def name?
    @name
  end

end
