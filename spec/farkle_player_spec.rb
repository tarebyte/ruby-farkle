# farkle_player.spec
require_relative '../lib/farkle_player.rb'

describe FarklePlayer do

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

end