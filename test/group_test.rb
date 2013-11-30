require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grouper'

class GroupTest < MiniTest::Test

  attr_reader :group

  def setup
    @group = Grouper::Group.new
    group.members = %w{one two three four five six seven eight nine ten}
  end

  def test_a_group_has_members
    assert_equal %w{one two three four five six seven eight nine ten}, group.members
  end

  def test_group_can_be_divided_into_teams
    team1 = Grouper::Team.new(%w{one two three})
    team2 = Grouper::Team.new(%w{four five six})
    team3 = Grouper::Team.new(%w{seven eight nine ten})
    assert_equal [team1, team2, team3], group.teams_of(3,group.members)
  end

  def test_order_does_not_matter_within_groups
    teams1 = group.teams_of(3, group.members)
    group.members = %w{two one three five six four ten seven nine eight}
    teams2 = group.teams_of(3, group.members)
    assert_equal teams1, teams2
  end

  def test_group_can_find_uniq_team_combinations
    unique_team_sets = group.unique_teams(3,20)
    unique_team_sets.all? do |teams_set|
      unique_team_sets.count(teams_set) == 1
    end
  end

end
