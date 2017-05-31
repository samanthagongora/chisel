require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'

class ChiselTest < Minitest::Test
  def test_it_can_open_a_readable_file
    chisel = Chisel.new
    ARGV = ['/Users/samanthagongora/turing/1module/challenges/chisel/my_input.markdown',
      '/Users/samanthagongora/turing/1module/challenges/chisel/my_output.html']

    refute chisel.open_read(markdown_file).closed?
  end

  def test_it_can_open_a_writable_file
    chisel = Chisel.new
    ARGV = ['/Users/samanthagongora/turing/1module/challenges/chisel/my_input.markdown',
      '/Users/samanthagongora/turing/1module/challenges/chisel/my_output.html']

    refute chisel.open_write(markdown_file).closed?
 end
end
