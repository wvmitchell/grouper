require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grouper'

class GrouperTest < MiniTest::Test

  def test_a_member_exists
    assert Grouper::Member
  end

end
