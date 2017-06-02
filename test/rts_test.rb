require "test_helper"

module RTime
  class RTSTest < Minitest::Test
    def test_assert_module_exists
      refute_nil RTime::RTS
    end

    def test_assert_time_for_provides_correct_time_for_valid_options
      hour, minute, second = RTime::RTS.send(:_time_for, night_only: false)
      assert_includes 0..23, hour
      assert_includes 0..59, minute
      assert_includes 0..59, second
      10.times do
        hour, minute, second = RTime::RTS.send(:_time_for, night_only: true)
        assert_includes (20..23).to_a + (0..5).to_a, hour
      end
    end

    def test_assert_parse_date_parses_time_correctly
      year, month, day = RTime::RTS.send(:_parse_date, "20170417")
      assert_equal 2017, year
      assert_equal 4, month
      assert_equal 17, day
      assert_raises(Exception) { RTime::RTS.send(:_parse_date, "2017047") }
    end

    def test_assert_selections_for_coverage_returns_correct_number_of_selections
      assert_equal 10, RTime::RTS.send(:_selections_for_coverage, 10, 1)
      assert_equal 16, RTime::RTS.send(:_selections_for_coverage, 20, 0.8)
      assert_equal 24, RTime::RTS.send(:_selections_for_coverage, 33, 0.75)
    end

    def test_assert_timestamps_in_range_returns_all_the_matching_timestamps
      range =
        RTime::RTS.send(
          :_timestamps_in_range,
          { start: "20170203", end: "20170129" },
          night_only: false
        )
      assert_instance_of Array, range
      assert_equal 6, range.count
      range.each { |timestamp| assert_instance_of Time, timestamp }
      assert_equal 29, range[0].day
      assert_equal 1, range[0].month
      assert_equal 3, range[-1].day
      assert_equal 2, range[-1].month
    end

    def test_assert_timestamps_provide_correct_timestamps_for_valid_arguments
      timestamps =
        RTime::RTS.timestamps(
          { start: "20170203", end: "20170129" }, 0.85
        )
      assert_instance_of Array, timestamps
      assert_equal 5, timestamps.count
      timestamps.each { |timestamp| assert_instance_of Time, timestamp }
    end
  end
end
