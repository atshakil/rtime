$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "simplecov"
SimpleCov.start do
  add_filter "/test/"
  add_group "lib", "lib"
end

require "rtime"

require "minitest/autorun"
