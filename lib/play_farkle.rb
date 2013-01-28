require_relative '../lib/ruby-farkle/farkle_player.rb'

print "Ruby Farkle for Neo\n"
print "Designed by Mark Tareshawty\n\n"

farkle_players = Array.new

print "Hello Player 1, what is your name: "
name = gets.chomp
player1 = FarklePlayer.new name
farkle_players << player1

print "Hello Player 2, what is your name: "
name = gets.chomp
player2 = FarklePlayer.new name
farkle_players << player2

system("clear")
index = 0
print "Hello #{farkle_players[0].name?} and #{farkle_players[1].name?} let's begin\n"

# Main Game, in this game whoever gets to 1000 points first wins!
#begin

# User has started their turn
farkle_players[index].start_turn
farkle_players[index].roll_dice

print "You rolled the following\n"
farkle_players[index].list_dice_in_cup

#end while ( farkle_players[0].total_score < 1000 || farkle_players[1].total_score < 1000 )

