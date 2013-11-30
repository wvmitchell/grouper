require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grouper'

class TeamTest < MiniTest::Test

  attr_reader :team

  def setup
    @team = Grouper::Team.new(%w{will tom bob john})
  end

  def test_a_team_has_members
    assert_equal 4, team.teammates.count
  end

  def test_all_teammates_are_of_the_type_memeber
    team.teammates.all? do |member|
      assert_equal Grouper::Member, member.class
    end
  end

  def test_team_knows_its_invalid_if_teammates_have_worked_together
    assert team.valid?
    team.mark_members
    team2 = Grouper::Team.new
    team2.teammates = [team.teammates[0], team.teammates[1]]
    refute team2.valid?
  end

end
