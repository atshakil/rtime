module RTime
  class RTS
    class << self
      def _time_for options
        hour = if options[:night_only]
          ((20..23).to_a + (0..5).to_a).sample
        else
          (0..23).to_a.sample
        end

        minute = (0..59).to_a.sample
        second = (0..59).to_a.sample

        [hour, minute, second]
      end

      def _parse_date date
        match = /^(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})$/.match date
        if match
          group = match.named_captures
          year = group["year"].to_i
          month = group["month"].to_i
          day = group["day"].to_i
          [year, month, day]
        else
          raise Exception.new "Date must be provided in YYYYMMDD format"
        end
      end

      def _selections_for_coverage total, coverage
        (total.to_f * coverage).to_i
      end

      def _timestamps_in_range date1, date2, options
        year, month, day = self._parse_date date1
        date1 = Time.new year, month, day
        year, month, day = self._parse_date date2
        date2 = Time.new year, month, day
        start_date, end_date = date1 < date2 ? [date1, date2] : [date2, date1]
        range = []
        tmp_date = start_date
        while tmp_date <= end_date

          hour, minute, second = self._time_for(options)
          range.push Time.new(tmp_date.year, tmp_date.month,
            tmp_date.day, hour, minute, second)
          tmp_date += 60 * 60 * 24 # 1 day
        end

        range
      end

      def timestamps(date1, date2, coverage, options={night_only: false})
        all_timestamps = self._timestamps_in_range date1, date2, options
        selection_count = self._selections_for_coverage all_timestamps.count,
          coverage
        all_timestamps.sample selection_count
      end
    end
  end
end
