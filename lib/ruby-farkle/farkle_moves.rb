# ../lib/ruby-farkle/farkle_moves.rb

class FarkleMoves

  attr_accessor :current_score, :current_dice, :farkle_count, :total_score

  def initialize

    @current_dice = {
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 0,
      5 => 0,
      6 => 0
    }

    @current_score  = 0
    @farkle_count   = 0
    @total_score    = 0

  end

  # Public: Remove all three of a kinds 
  # and add them to the current score
  #
  # Returns nil if nothing was removed
  #
  def collect_all_sets_of_three

    three_or_more = self.get_all_sets_of_three

    if three_or_more != nil

      three_or_more.each do |three_value|

        # special case because three 1's get you 1000 points
        if three_value == 1
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

  # Public: Collects and scores the what set of three
  # the user wants
  #
  def collect_one_set_of_three ( value )



  end

  # Public: Collect a single scoring die that the user chooses
  #
  def collect_one_scoring_die ( die )

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
  # as a string or nil if there wasn't anything
  #
  def view_all_sets_of_three

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
      three_of_a_kind_or_more.to_s
    else
      nil
    end

  end


  # Public: Prints out all of the dice that can be used for single
  # scoring that are not part of a set of three
  #
  def view_all_single_scoring_dice

  end

end
