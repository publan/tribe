require_relative "test_helper"

class TribeChallengeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TribeChallenge::VERSION
  end
end
