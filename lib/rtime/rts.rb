# The primary module for `rtime`
module RTime
  # `RTS` implements random timestamp generator API
  class RTS
    class << self
      # Returns a time segment specific to the provided options
      def _time_for options
        hour =
          if options[:night_only]
            ((20..23).to_a + (0..5).to_a).sample
          else
            (0..23).to_a.sample
          end

        time_unit_sample = (0..59).to_a.sample
        minute = time_unit_sample
        second = time_unit_sample

        [hour, minute, second]
      end

      # Parses date from `YYYYMMDD` format
      #
      # Returns a time segment
      #--
      # TODO: investigate :reek:FeatureEnvy
      def _parse_date date
        match = /^(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})$/.match date

        unless match
          raise(Exception, "Date must be provided in YYYYMMDD format")
        end

        group = match.names.zip(match.captures).to_h
        year = group["year"].to_i
        month = group["month"].to_i
        day = group["day"].to_i
        [year, month, day]
      end

      # Returns a count that can be selected from the total count for a
      # specified coverage
      def _selections_for_coverage total, coverage
        (total.to_f * coverage).to_i
      end

      # Returns all the timestamp in a range
      #--
      # TODO: investigate :reek:FeatureEnvy
      def _timestamps_in_range date_range, options
        start_date = Time.new(*_parse_date(date_range[:start]))
        end_date = Time.new(*_parse_date(date_range[:end]))
        start_date, end_date =
          if start_date < end_date
            [start_date, end_date]
          else
            [end_date, start_date]
          end
        range = []
        tmp_date = start_date

        while tmp_date <= end_date
          range.push Time.new(
            tmp_date.year, tmp_date.month, tmp_date.day, *_time_for(options)
          )
          tmp_date += 60 * 60 * 24 # 1 day
        end

        range
      end

      # Returns a specified percentage of random timestamp in a range
      def timestamps date_range, coverage, options = { night_only: false }
        all_timestamps = _timestamps_in_range date_range, options
        selection_count =
          _selections_for_coverage all_timestamps.count, coverage
        all_timestamps.sample(selection_count).sort
      end
    end
  end
end
