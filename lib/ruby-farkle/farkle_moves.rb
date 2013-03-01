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
# => 'Collect' all single scoring dice
#
# For sets of three
# => 'Check' to see if there are any sets of three (returns true or false) 
# => 'Collect' a single given set of three defined by the user and score accordingly
# => 'Collect' all instances of sets of three and score them accordingly
#
 
class FarkleMoves

  attr_accessor :current_score, :current_dice, :dice_cup, :farkle_count, :total_score

  def initialize

    @dice_cup = Array.new
    @number_of_dice = 6
    @current_score  = 0
    @farkle_count   = 0
    @total_score    = 0

  end



  #####################################################
  ## Methods that do not deal with manipulating dice ##
  #####################################################

  # Public: Check is the user farkled, and if so 
  # iterate the count by one
  #
  # Return true is found otherwise false
  def farkle?

    if !self.sets_of_three? && !self.single_scoring?
      @farkle_count += 1
      @current_score = 0
      true
    else
      false
    end
  end



  ################################################
  ## Methods that deal with single scoring dice ##
  ################################################

  # Public: Collect a single scoring die that the user chooses
  #
  def collect_one_die(value)

    if @dice_cup.has_value?(value)

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

  # Public: Pulls of all of the single scoring dice
  # from the cup and adds them to the current score
  #
  # Can only be a 1 or 5
  # Each 1 gets you 100 points
  # Each 5 gets you  50 points
  #
  def collect_single_dice

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

  # Public: Check the set to see if there
  # are any single scoring dice
  # 
  # Return true if there are else false
  #
  def single_scoring?

  end



  ########################################################
  ## Methods that deal with sets of three dice in a set ##
  ########################################################

  # Public: Remove all three of a kinds
  # and add them to the current score
  #
  # Returns nil if nothing was removed
  #
  def collect_all_three_sets

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

  # Public: Collects and scores the what set of three
  # the user wants
  #
  def collect_three_set(value)

    new_set = @dice_cup.group_by{ |i| i }

    new_set.each_value do |v|
      3.times { v.pop } if v.length >= 3 && v[0] == num
    end

    @dice_cup.clear
    new_set.each_value{ |v| self << v }
    @dice_cup.flatten
  end

  # Public run a check to see if there is a set of three
  # in the current dice collection
  # 
  # Return true else false
  def three_set?

  end

end