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

		describe "testing for single scoring die" do
			it "should find single scoring dice" do
				player = FarkleMoves.new
				player.dice_cup = (1..6).to_a
				player.single_scoring?.should eq(true)
			end
		
			it "should not find single scoring dice" do
				player = FarkleMoves.new
				player.dice_cup = [2, 3, 4, 6, 2, 3]
				player.single_scoring?.should eq(false)
			end
		end

		describe "manipulating single scoring dice" do
			it "should remove all single scoring dice" do
				player = FarkleMoves.new
				player.dice_cup = [1, 1, 1, 2, 2, 2]
				player.collect_single_dice
				player.dice_cup.should eq([2,2,2])
			end

			it "should remove a single 'one' from the set" do
				player = FarkleMoves.new
				player.dice_cup = (1..6).to_a
				player.collect_single_dice(1)
				player.dice_cup.should eq([2,3,4,5,6])
			end

			it "should remove a five from the set" do
				player = FarkleMoves.new
				player.dice_cup = (1..6).to_a
				player.collect_single_dice([1,5])
				player.dice_cup.should eq([2,3,4,6])
			end

			it "should remove two ones and a five" do
				player = FarkleMoves.new
				player.dice_cup = [1, 1, 2, 3, 4, 5]
				player.collect_single_dice([1,1,5])
				player.dice_cup.should eq([2,3,4])
			end
		end

		describe "scoring of single dice" do
			it "should have a current score of 100" do
				player = FarkleMoves.new
				player.dice_cup = (1..6).to_a
				player.collect_single_dice(1)
				player.current_score.should eq(100)
			end

			it "should have a current_score of 150" do
				player = FarkleMoves.new
				player.dice_cup = (1..6).to_a
				player.collect_single_dice
				player.current_score.should eq(150)
			end
		end
	end

	describe "single scoring and sets of three" do

		describe "manipulating singles and threes" do
			it "should two dice left" do
				player = FarkleMoves.new
				player.dice_cup = [1,3,1,5,1,6]
				player.collect_three_set
				player.collect_single_dice
				player.dice_cup.should eq([3,6])
			end
		end
		
		describe "scoring singles and threes" do
			it "should have a score of 1150" do
				player = FarkleMoves.new
				player.dice_cup = [1,1,1,1,5,6]
				player.collect_three_set
				player.collect_single_dice
				player.current_score.should eq(1150)
			end
		end
	end
end