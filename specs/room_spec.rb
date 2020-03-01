require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")

class TestRoom <MiniTest::Test

  def setup
    @song1 = Song.new("going home")
    @guest1 = Guest.new("Jun",1,1000.0)
    @guest2 = Guest.new("John",2,2000.0)
    @guest3 = Guest.new("Steven",3,1500.0)
    @room1 = Room.new("edinburgh",1,10,2)
  end

  def test_get_name()
    assert_equal("edinburgh",@room1.name)
  end

  def test_get_r_id()
    assert_equal(1,@room1.r_id)
  end

  def test_get_songs()
    assert_equal([],@room1.songs)
  end

  def test_get_guests()
    assert_equal([],@room1.guests)
  end

  def test_get_free_seats()
    assert_equal(2,@room1.free_seats)
  end

  def test_get_check_in_fee()
    assert_equal(10,@room1.check_in_fee)
  end

  def test_add_guest__not_exist_in_room()
    @room1.add_guest(@guest1)
    assert_equal(1,@room1.guests.count())
  end

  # One person just can be added into a room once
  def test_add_guest__exist_in_room()
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest1)
    assert_equal(1,@room1.guests.count())
  end

  # If there has no seats(space) in a room, no more check in
  def test_add_guest__no_more_seats()
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    assert_equal(2,@room1.guests.count())
  end

  # Guest cannot be checked in if they don't have enough money
  def test_add_guest__pay_failed()
    dr_poor = Guest.new("Dr poor",5,5.0)
    @room1.add_guest(dr_poor)
    assert_equal(0,@room1.guests.count)
  end

  def test_remove_guest__exist_in_room()
    @room1.add_guest(@guest1)
    @room1.remove_guest(@guest1)
    assert_equal(0,@room1.guests.count())
  end

  def test_remove_guest__not_exist_in_room()
    @room1.remove_guest(@guest2)
    assert_equal(0,@room1.guests.count())
  end

  def test_add_song()
    @room1.add_song(@song1)
    assert_equal(1,@room1.songs.count())
  end

  def test_check_out_pay()
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    assert_equal(20,@room1.check_out_pay())
  end 

end
