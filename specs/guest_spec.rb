require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../room.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Jun",1,1000.0)
    @song1 = Song.new("going home")
    @room1 = Room.new("edinburgh",1,10,2)
  end

  def test_get_name()
    assert_equal("Jun",@guest1.name)
  end

  def test_get_g_id()
    assert_equal(1,@guest1.g_id)
  end

  def test_get_cash()
    assert_equal(1000.00,@guest1.cash)
  end

  def test_get_favourite_songs()
    assert_equal([],@guest1.favourite_songs)
  end

  def test_add_favourite_song()
    @guest1.add_favourite_song(@song1)
    assert_equal(1,@guest1.favourite_songs.count())
  end

  def test_remove_favourite_song()
    @guest1.add_favourite_song(@song1)
    @guest1.remove_favourite_song(@song1)
    assert_equal(0,@guest1.favourite_songs.count())
  end

  def test_favourite_song_in_room__exist()
    @guest1.add_favourite_song(@song1)
    @room1.add_song(@song1)
    assert_equal(true,@guest1.favourite_songs_in_room(@room1))
  end

  def test_favourite_song_in_room__not_exist()
    @guest1.add_favourite_song(@song1)
    assert_equal(false,@guest1.favourite_songs_in_room(@room1))
  end

end
