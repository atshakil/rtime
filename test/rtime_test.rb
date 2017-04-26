require "test_helper"

class RTimeTest < Minitest::Test
  def test_assert_module_has_a_version_constant
    refute_nil ::RTime::VERSION
  end
end
