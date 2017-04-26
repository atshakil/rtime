require "test_helper"

class RTime::RTSTest < Minitest::Test
  def test_assert_module_exists
    refute_nil RTime::RTS
  end
end
