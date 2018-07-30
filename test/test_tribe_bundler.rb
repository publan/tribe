require_relative "test_helper"

class TestTribeBundler < MiniTest::Test
  def setup
    @subject = TribeBundler.new
  end

  def test_parse
    response = @subject.parse("10 IMG 15 FLAC 13 VID")
    TribeBundler.format(response)
  end
end
