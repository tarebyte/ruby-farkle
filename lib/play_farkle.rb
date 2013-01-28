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

print "Hello #{farkle_players[0].name?} and #{farkle_players[1].name?} let's begin"

