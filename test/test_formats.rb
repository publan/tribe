require "test_helper"

class TestFormats < MiniTest::Test
  def test_formats_has_data
    assert_equal false, Formats::FORMATS.nil?
  end
end
