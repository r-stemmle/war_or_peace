require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/lets_play_cards'

class WarTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, "2", 2)
    @card2 = Card.new(:heart, "3", 3)
    @card3 = Card.new(:heart, "4", 4)
    @card4 = Card.new(:heart, "5", 5)
    @card5 = Card.new(:heart, "6", 6)
    @card6 = Card.new(:heart, "7", 7)
    @card7 = Card.new(:heart, "8", 8)
    @card8 = Card.new(:heart, "9", 9)
    @card9 = Card.new(:heart, "10", 10)
    @card10 = Card.new(:heart, "Jack", 11)
    @card11 = Card.new(:heart, "Queen", 12)
    @card12 = Card.new(:heart, "King", 13)
    @card13 = Card.new(:heart, "Ace", 14)
    @card14 = Card.new(:club, "2", 2)
    @card15 = Card.new(:club, "3", 3)
    @card16 = Card.new(:club, "4", 4)
    @card17 = Card.new(:club, "5", 5)
    @card18 = Card.new(:club, "6", 6)
    @card19 = Card.new(:club, "7", 7)
    @card20 = Card.new(:club, "8", 8)
    @card21 = Card.new(:club, "9", 9)
    @card22 = Card.new(:club, "10", 10)
    @card23 = Card.new(:club, "Jack", 11)
    @card24 = Card.new(:club, "Queen", 12)
    @card25 = Card.new(:club, "King", 13)
    @card26 = Card.new(:club, "Ace", 14)
    @card27 = Card.new(:diamond, "2", 2)
    @card28 = Card.new(:diamond, "3", 3)
    @card29 = Card.new(:diamond, "4", 4)
    @card30 = Card.new(:diamond, "5", 5)
    @card31 = Card.new(:diamond, "6", 6)
    @card32 = Card.new(:diamond, "7", 7)
    @card33 = Card.new(:diamond, "8", 8)
    @card34 = Card.new(:diamond, "9", 9)
    @card35 = Card.new(:diamond, "10", 10)
    @card36 = Card.new(:diamond, "Jack", 11)
    @card37 = Card.new(:diamond, "Queen", 12)
    @card38 = Card.new(:diamond, "King", 13)
    @card39 = Card.new(:diamond, "Ace", 14)
    @card40 = Card.new(:spade, "2", 2)
    @card41 = Card.new(:spade, "3", 3)
    @card42 = Card.new(:spade, "4", 4)
    @card43 = Card.new(:spade, "5", 5)
    @card44 = Card.new(:spade, "6", 6)
    @card45 = Card.new(:spade, "7", 7)
    @card46 = Card.new(:spade, "8", 8)
    @card47 = Card.new(:spade, "9", 9)
    @card48 = Card.new(:spade, "10", 10)
    @card49 = Card.new(:spade, "Jack", 11)
    @card50 = Card.new(:spade, "Queen", 12)
    @card51 = Card.new(:spade, "King", 13)
    @card52 = Card.new(:spade, "Ace", 14)
    @box_cards = [@card1, @card2, @card3, @card4, @card5, @card6, @card7, @card8, @card9, @card10, @card11, @card12, @card13, @card14, @card15, @card16, @card17, @card18, @card19, @card20, @card21, @card22, @card23, @card24, @card25, @card26, @card27, @card28, @card29, @card30, @card31, @card32, @card33, @card34, @card35, @card36, @card37, @card38, @card39, @card40, @card41, @card42, @card43, @card44, @card45, @card46, @card47, @card48, @card49, @card50, @card51, @card52]
    @shuffled_deck = @box_cards.shuffle
    @deck1 = Deck.new(@shuffled_deck.take 26)
    @deck2 = Deck.new(@shuffled_deck.drop 26)
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end
  def test_it_exists
    war1 = War.new(@turn)
# require "pry"; binding.pry
    assert_instance_of War, war1
  end

  def test_it_has_attributes
    war1 = War.new(@turn)

    assert_equal @turn, war1.turn
  end

  def test_it_can_have_winner_of_turn_1
    war1 = War.new(@turn)
    #I tried using assert_equal with || operator but it doesn't work
    refute_nil @turn.winner.name
  end

  def test_it_can_ask_to_start_a_game
    # skip
    war1 = War.new(@turn)

    assert_equal "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are Megan and Aurora. Type 'GO' to start the game!", war1.ask_start
  end

  def test_user_can_respond_GO
    skip
    war1 = War.new(@turn)
    # war1.say_go
    assert_equal "GO", war1.say_go
  end

  def test_war_start_can_run_ask_start_say_go
    skip
    war1 = War.new(@turn)
    war1.start
    # this test will not pass if game starts with war or mad.
    assert_equal 2, war1.turn.spoils_of_war.length
  end

  def test_if_user_doesnt_say_GO
    skip
    war1 = War.new(@turn)
    #for this test to pass, test line 100 must fail
    assert_equal "What game do you want to play!?", war1.start
  end

  def test_play_loops_until_1000000_or_winner
    war1 = War.new(@turn)
    #this scenario is a bit canned but it shows the game plays...
    assert_equal "*~*~*~* Aurora has won the game! *~*~*~*", war1.start
  end
end
