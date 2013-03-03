require_relative 'farkle_moves.rb'

class FarkleBrain < FarkleMoves

  def run_all_options
    print "These are the dice you have: \n"
    self.to_s

    print "\nWhat would you like to do?\n"
    print "1. Collect single scoring dice?\n"
    print "2. Collect a triple\n"
    #print "3. Store dice for later"

    print "Choice: "
    choice = gets.chomp

    case choice
    when 1
      self.single_options
    when 2
      self.three_options
      #when 3
    else
    end
  end

  private

  # TODO
  #def store_dice_options
  #end

  def single_options
    if self.single_scoring?
      print "What would you like to do?\n"
      print "1. Remove all single scroing dice\n"
      print "2. Select which dice you wish to remove\n"

      print "Choice: "
      choice = gets.chomp

      case choice
      when 1
        self.collect_single_dice
      when 2
        print "Please enter the number of dice you want to remove: "
        remove_count = get.chomp

        removed_dice = Array.new

        remove_count.times do
          print "value: "
          remove_dice << gets.chomp
          print "\n"
        end

        self.collect_single_dice(remove_dice)

      else
        print "Nothing Happened\n"
      end

    else
      print "invalid, no single scoring dice\n"
    end
  end

  def three_options
    if self.three_set?
      print "What would you like to do?\n"
      print "1. Remove all sets of three\n"
      print "2. Remove a set of three\n"
      print "3. Nothing\n"
      print "Choice: "
      player_choice = gets.chomp

      case player_choice
      when 1
        self.collect_three_set
      when 2
        print "\nWhat set of three would you like to remove?\n"
        set_choice = gets.chomp
        self.collect_three_set(set_choice)
        print "Set of #{set_choice}'s removed"
      else
        print "\nNothing happened\n"
      end
    else
      print "invalid, there are no sets of three dice\n"
    end
  end
end
