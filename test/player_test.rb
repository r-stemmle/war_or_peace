require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, "Queen", 12)
    @card2 = Card.new(:spade, "3", 3)
    @card3 = Card.new(:heart, "Ace", 14)
  end

  def test_it_exists
    @card1
    @card2
    @card3
    cards = [@card1, @card2, @card3]
    deck = Deck.new(@card1, @card2, @card3)
    player = Player.new("Clarisa", deck)

    assert_instance_of Player, player
  end

  def test_that_player_has_name
    @card1
    @card2
    @card3
    cards = [@card1, @card2, @card3]
    deck = Deck.new(@card1, @card2, @card3)
    player = Player.new("Clarisa", deck)

    assert_equal "Clarisa", player.name
  end

  def test_that_player_has_deck
    @card1
    @card2
    @card3
    deck = Deck.new(@card1, @card2, @card3)
    player = Player.new("Clarisa", deck)

    assert_equal deck, player.deck
  end

  def test_player_has_not_lost
    @card1
    @card2
    @card3
    deck = Deck.new(@card1, @card2, @card3)
    player = Player.new("Clarisa", deck)

    assert_equal false, player.has_lost?
  end

  def test_that_player_can_lose
    # skip
    @card1
    @card2
    @card3
    deck = Deck.new(@card1, @card2, @card3)
    player = Player.new("Clarisa", deck)
    player.deck.remove_card
    
    assert_equal false, player.has_lost?
    player.deck.remove_card

    assert_equal false, player.has_lost?
    player.deck.remove_card

    assert_equal true, player.has_lost?
  end
end
