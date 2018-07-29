require "test_helper"

class TestTribeBundles < MiniTest::Test
  def setup
    @subject = TribeBundles.new
  end

  def test_bundles_has_data
    assert_equal false, TribeBundles::BUNDLES.nil?
  end

  def test_codes
    # looks lazy, but I'd rather not having to change this if BUNDLES gets
    # updated with new values 
    assert_equal true, @subject.codes.size > 0
  end


  def test_bundles
    # looks lazy, but I'd rather not having to change this if BUNDLES gets
    # updated with new values 
    assert_equal true, @subject.bundles('img').size > 0
  end

  def test_bundles_counts
    # looks lazy, but I'd rather not having to change this if BUNDLES gets
    # updated with new values 
    assert_equal true, @subject.bundle_counts('img').size > 0
  end
end
