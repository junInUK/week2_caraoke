require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../song.rb")

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("going home")
  end

  def test_get_name()
    assert_equal("going home",@song1.name)
  end

end
