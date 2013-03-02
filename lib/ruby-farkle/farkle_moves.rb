# ../lib/ruby-farkle/farkle_moves.rb
#
# Public: Methods that can be used by a farkle player in order for them
# manipulate the dice to get the scoring of the choosing.
#
#
# This class allows you to do the following:
# 
# For scoring
# => Check the current set of dice and iterate a 'farkle count' if the set contains a farkle
# ==> if the farkle count is 3 then the users current score gets set back to 0
# 
# For single scoring dice (1/5)
# => 'Check' to see if there are any single scoring dice (returns true or false) 
# => 'Collect' a single scoring dice and score accordingly
# => 'Collect' all of a certain specification of single scoring dice (all ones or all fives)
# => 'Collect' all single scoring dice
#
# For sets of three
# => 'Check' to see if there are any sets of three (returns true or false) 
# => 'Collect' a single given set of three defined by the user and score accordingly
# => 'Collect' all instances of sets of three and score them accordingly
#
 
class FarkleMoves

  def initialize

    @dice_cup = Array.new
    @number_of_dice = 6
    @current_score  = 0
    @farkle_count   = 0
    @total_score    = 0

  end

  attr_accessor :dice_cup, :number_of_dice, :current_score, :farkle_count, :total_score

  ########################################################
  ## Methods that do not deal with single or three sets ##
  ########################################################

  # Public: Check is the user farkled, and if so 
  # iterate the count by one
  #
  # Return true is found otherwise false
  def farkle?

    if !self.three_set? && !self.single_scoring?
      @farkle_count += 1
      @current_score = 0
      true
    else
      false
    end
  end

  # Public: reset a users setting that deal with the current turn
  # 
  def reset
    @dice_cup.clear
    @number_of_dice = 6
    @farkle_count= 0
  end



  ################################################
  ## Methods that deal with single scoring dice ##
  ################################################

  # Public: Pulls of all of the single scoring dice
  # from the cup and adds them to the current score
  #
  # Can only be a 1 or 5
  # Each 1 gets you 100 points
  # Each 5 gets you  50 points
  #
  def collect_single_dice(*value)

    @dice_cup.each do |v|

      case @dice_cup[k]
      when 1
        @current_score += 100
      when 5
        @current_score += 50
      end

    end

    @dice_cup.delete_if { |i| i == 1 || i == 5 }

  end

  # Public: Check the set to see if there
  # are any single scoring dice
  #
  def single_scoring?
    @dice_cup.each do |die|
      if die == 1 || die == 5
        return true
      end
    end

    false # No single scoring die... :-(
  end



  ########################################################
  ## Methods that deal with sets of three dice in a set ##
  ########################################################

  # Public: Collects and scores the what set of three
  # the user wants
  #
  # If more than 1 value is passed in nothing will happen
  # to dice
  #
  def collect_three_set(*value)

    new_set = @dice_cup.group_by { |i| i }

    if value.length.zero?
      new_set.each do |k, v|
        if v.length >= 3
          remove_three_and_score(k, v)
        end
      end

    elsif value.length == 1
      new_set.each do |k, v|
        if v.length >= 3 && k == value.first
          remove_three_and_score(k, v)
        end
      end
    end

    # Set everything back in order
    @dice_cup.clear
    new_set.each_value{ |v| @dice_cup << v } # Shovel them in!!!
    @dice_cup.flatten!
  end

  # Public run a check to see if there is a set of three
  # in the current dice collection
  # 
  def three_set?
    collected_dice = @dice_cup.group_by { |i| i }

    collected_dice.each_value do |v|
      if v.length >= 3
        return true
      end
    end

    false # No sets of three... :-(
  end



  private
  def remove_three_and_score(k, v)
    3.times { v.pop }
    k == 1 ? @current_score += 1000 : @current_score += (k * 100)
    @number_of_dice -= 3
  end

end