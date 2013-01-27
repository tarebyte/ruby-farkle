Neo Farkle for Ruby
===================

<table>
  <tr>
    <td> Author: </td>
    <td> Mark Tareshawty </td>
  </tr>

  <tr>
    <td> Email: </td>
    <td> <a href="mailto:tarebyte@gmail.com">tarebyte@gmail.com </td>
  </tr>
</table>

##Overview
This a is two player Ruby based Farkle game. This is the excercise given by [Neo](http://neo.com) for their [Apprentice Interview](http://ohiojobs.neo.com/apprentice)

##Play
(If you already know how to play Farkle go on down to how to run the game)

Farkle is played by two or more players, with each player in succession having a turn at throwing the dice. Each player's turn results in a score, and the scores for each player accumulate to some winning total (usually 10,000).
  - At the beginning of each turn, the player throws all of the dice at once from a cup.
  - After each throw, one or more scoring dice must be set aside
  - The player may then either end their turn and bank the score accumulated so far, or continue to throw the remaining dice. 
  If the player has scored all six dice, they have "hot dice" and may continue their turn with a new throw of all six dice, adding to the score they have already accumulated. There is no limit to the number of "hot dice" a player may roll in one turn.
  - If none of the dice score in any given throw, the player has "farkled" and all points for that turn are lost.

##Scoring
Scoring can get fairly complex depending on what the player wished to do.

| Dice Combination | Score  |
| ---------------- | -----: |
| Each 1           |   100  |
| Each 5           |    50  |
| Three 1s         |  1000  |
| Three 2s         |   200  |
| Three 3s         |   300  |
| Three 4s         |   400  |
| Three 5s         |   500  |
| Three 6s         |   600  |

If a player doesn't score for three turns in a row that is considered a Farkle, and therefore they lose 1000 point.

For example if a player throws 1-2-3-3-3-5, they could do any of the following (plus more options)
  - score three 3s as 300 and then throw the remaining three dice
  - score the single 1 as 100 and then throw the remaining five dice
  - score the single 5 as 50 and then throw the remaining five dice
  - score three 3s, the single 1, and the single 5 for a total of 450 and then throw the remaining die
  - score three 3s, the single 1, and the single 5 for a total of 450 and stop, banking 450 points in that turn

NOTE
Each scoring combination must be achieved in a single throw.
For example, if a player has already set aside two individual 1s
and then throws a third with the four dice remaining,
they do not have a triplet of 1s for a score of 1000
but merely three individual 1s for a score of 300.

##How to run this game
All you have to do is run:

    rake

And let the game begin!

##Testing
If you are contributing or just want to run the Rspec tests:

    rake spec

This will run every Rspec file in the spec folder

##What I used
  - Ruby 1.9.3
  - Rspec
  - Tomdoc
  