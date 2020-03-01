require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")
require_relative("../drink.rb")
require_relative("../count.rb")

class TestCount <MiniTest::Test

  def setup
    @drink1 = Drink.new("beer",2.2,5)
    @drink2 = Drink.new("wine",4.3,15)
    @drink3 = Drink.new("whisky",5.2,40)
    @count1 = Count.new("No7",0)
  end

  def test_get_count_name()
    assert_equal("No7",@count1.name)
  end

  def test_add_stock()
    @count1.add_stock(@drink1.name,3)
    assert_equal(3,@count1.products["beer"][:count])
  end
end
