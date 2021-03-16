require "test_helper"

class A2Test < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::A2::VERSION
  end
end
