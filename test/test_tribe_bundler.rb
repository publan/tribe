require "test_helper"

class TestTribeBundler < MiniTest::Test
  def setup
    @subject = TribeBundler.new
  end

  def test_parse
    response = <<-HDOC
    10 IMG $800
      1 x 10 $800
    15 FLAC $1957.50
      1 x 9 $1147.50
      1 x 6 $810
    13 VID $2370
      2 x 5 $1800
      1 x 3 $570
    HDOC
    assert_equal response, @subject.parse("10 IMG 15 FLAC 13 VID")
    #assert_equal response, @subject.parse("13 VID")
  end
end
