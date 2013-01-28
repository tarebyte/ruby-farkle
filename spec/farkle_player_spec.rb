# farkle_player.spec
require_relative '../lib/ruby-farkle/farkle_player.rb'

describe FarklePlayer do

  # Make sure that a player starts
  # their turn with everything they need
  #
  it "starts a player on a new turn with a current score of 0" do
    player = FarklePlayer.new "Mark"
    player.start_turn
    player.current_score.should eq(0)
  end

  it "starts a player out with 6 dice" do
    player = FarklePlayer.new "Mark"
    player.start_turn
    player.current_dice_cup.size.should eq(6)
  end

  it "resets the players Farkle count to 0" do
    player = FarklePlayer.new "Mark"
    player.start_turn
    player.current_farkle_count.should eq (0)
  end

  it "sets a value for every dice in the cup that is not 0" do
    player = FarklePlayer.new "Mark"
    player.start_turn
    player.roll_dice
    player.current_dice_cup.has_value?(0).should eq(false)
  end

  it "returns the given players name that was set" do
    player = FarklePlayer.new "Mark"
    player.name?.should eq("Mark")
  end

  # Basic Dice movements
  #
  it "removes all 1's and 5's from the game and adds them to the score" do
    player = FarklePlayer.new "Mark"
    player.start_turn
    player.roll_dice

    if ( player.current_dice_cup.has_value?(1) || player.current_dice_cup.has_value?(5) )
      player.collect_all_single_scoring_dice
    end

    player.current_dice_cup.has_value?(1).should eq (false)
    player.current_dice_cup.has_value?(5).should eq (false)

  end

  it "confirms that if there is a set of three or more it is found" do
    player = FarklePlayer.new "Mark"
    player.start_turn
    player.roll_dice

    if player.are_there_any_three_or_more_sets?
      ( player.get_all_three_of_a_kind_or_more != nil ).should eq(true)
    end
  end

  it "removes all sets of threes in the dice_cup" do
    player = FarklePlayer.new "Mark"
    player.start_turn
    player.roll_dice

    if player.are_there_any_three_or_more_sets?

      player.collect_all_three_of_a_kind
      player.are_there_any_three_or_more_sets?.should eq(false)

    else
      player.are_there_any_three_or_more_sets?.should eq(false)

    end

  end

end
