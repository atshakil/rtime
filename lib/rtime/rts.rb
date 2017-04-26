module RTime
  class RTS
    class << self
      def _time_for options
      end

      def _parse_date date
      end

      def _selections_for_coverage total, coverage
      end

      def _timestamps_in_range date1, date2, options
      end

      def timestamps(date1, date2, coverage, options={
        night_only: false})
      end

      private :_time_for, :_parse_date, :_selections_for_coverage,
        :_timestamps_in_range
    end
  end
end
