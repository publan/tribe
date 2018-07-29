require "test_helper"

class TestFormats < MiniTest::Test
  def setup
    @formats = Formats.new
  end

  def test_formats_has_data
    assert_equal false, Formats::FORMATS.nil?
  end

  def test_formats_lookup
    assert_equal true, @formats.lookup('img').size > 0
  end
end
