require './lib/game.rb'
require './lib/player.rb'
require './lib/deck.rb'
require './lib/card.rb'
require 'pry'
# ♠ U+2660 Black Spade Suit
# ♡ U+2661 White Heart Suit
# ♢ U+2662 White Diamond Suit
# ♣ U+2663 Black Club Suit

suit_changer = {"S" => "\u2660", "H" => "\u2661", "D" => "\u2662", "C" => "\u2663"}


system("clear")
puts "GO FISH ********** GO FISH ************ GO FISH ************* GO FISH ********** GO FISH"
puts "Player 1, Please enter your name:"
player_1_name = gets.chomp
puts "\nPlayer 2, Please enter your name:"
player_2_name = gets.chomp
new_game = Game.new(player_1_name, player_2_name)
new_game.deal
system("clear")

while new_game.deck.length > 0 || new_game.players[0].hand.length > 0 || new_game.players[1].hand.length > 0 do
  new_game.players[new_game.turn].hand_sort
  puts "#{new_game.players[new_game.turn].name} here is your current hand:"
  new_game.players[new_game.turn].hand.each {|card| puts card.value + suit_changer[card.suit]}
  puts "You currently have #{new_game.players[new_game.turn].points} points"
  puts "#{new_game.players[new_game.turn].name} What card do you want to ask #{new_game.players[new_game.turn ^ 1].name} for?"
  card_choice = gets.chomp

  until new_game.has_card(card_choice, new_game.turn)
    puts "Oops, looks like you dont have that card to ask for"
    puts "#{new_game.players[new_game.turn].name} What card do you want to ask #{new_game.players[new_game.turn ^ 1].name} for?"
    card_choice = gets.chomp
  end

  if new_game.has_card(card_choice, new_game.turn ^ 1)
    new_game.check_hand(card_choice)
    puts "#{new_game.players[new_game.turn ^ 1].name} gives you all of their #{card_choice}'s"
  else
    puts "GO FISH!"
    new_game.draw_card
    puts "You drew a #{new_game.players[new_game.turn].hand[-1].value} of #{suit_changer[new_game.players[new_game.turn].hand[-1].suit]}"
    new_game.toggle_turn
  end
  if new_game.players[new_game.turn].remove_4s
    new_game.players[new_game.turn].remove_4s
    puts "You scored a point by collecting all of the #{new_game.players[new_game.turn].remove_card}'s"
  end
  puts "Press enter to advance"
  gets.chomp
  system("clear")
end
