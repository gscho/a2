$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "a2"

require "minitest/autorun"

def stub_stdin_puts(input, &block)
  string_io = StringIO.new
  string_io.puts input
  string_io.rewind
  $stdin = string_io
  output = block.call
  $stdin = STDIN
  output
end
