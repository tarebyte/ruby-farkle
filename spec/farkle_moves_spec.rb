# farkle_moves_spec.rb
require_relative "../lib/ruby-farkle/farkle_moves.rb"

describe FarkleMoves do

	describe "farkle check" do
		it "should find a farkle" do
			player = FarkleMoves.new
			player.dice_cup = [2, 3, 6, 4, 4]
			player.farkle?.should eq(true)
		end

		it "should not find a farkle" do
			player = FarkleMoves.new
			player.dice_cup = [2, 3, 5, 4, 4]
			player.farkle?.should eq(false)
		end
	end

	describe "sets of three only" do

		describe "testing sets of three" do
			
			it "there should be a set of three" do
				player = FarkleMoves.new
				player.dice_cup = [1, 1, 1, 2, 4, 5]
				player.three_set?.should eq(true)
			end

			it "there should not be a set of three" do
				player = FarkleMoves.new
				player.dice_cup = (1..6).to_a
				player.three_set?.should eq(false)
			end
		end

		describe "manipulating sets of three" do

			it "should have three dice and no arguments" do
				player = FarkleMoves.new
				player.dice_cup = [1, 1, 1, 2, 4, 5]
				player.collect_three_set
				player.dice_cup.should eq([2,4,5])
			end

			it "should remove set of ones only" do
				player = FarkleMoves.new
				player.dice_cup = [1, 1, 1, 2, 3, 4]
				player.collect_three_set(1)
				player.dice_cup.should eq([2,3,4])
			end
	
			it "should remove both sets of three" do
				player = FarkleMoves.new
				player.dice_cup = [1, 1, 1, 2, 2, 2]
				player.collect_three_set
				player.dice_cup.should eq([])
			end
			
			it "should remove only the set of twos" do
				player = FarkleMoves.new
				player.dice_cup = [1, 1, 1, 2, 2, 2]
				player.collect_three_set(2)
				player.dice_cup.should eq([1,1,1])
			end

			it "should remove only the set of ones" do
				player = FarkleMoves.new
				player.dice_cup = [1, 1, 1, 2, 2, 2]
				player.collect_three_set(1)
				player.dice_cup.should eq([2,2,2])
			end
		end
	
		describe "scoring with sets of three" do

			it "should have a current score of 200" do
				player = FarkleMoves.new
				player.dice_cup = [1, 1, 1, 2, 2, 2]
				player.collect_three_set(2)
				player.current_score.should eq(200)
			end

			it "should have a current score of 1000" do
				player = FarkleMoves.new
				player.dice_cup = [1, 1, 1, 2, 2, 2]
				player.collect_three_set(1)
				player.current_score.should eq(1000)
			end

			it "should have a current score of 1200" do
				player = FarkleMoves.new
				player.dice_cup = [1, 1, 1, 2, 2, 2]
				player.collect_three_set
				player.current_score.should eq(1200)
			end
		end
	end


	describe "single scoring dice only" do


	end
end