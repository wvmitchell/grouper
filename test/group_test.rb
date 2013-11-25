require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grouper'

class GroupTest < MiniTest::Test

  attr_reader :group

  def setup
    people = %w{Will Logan Eric Layla}.collect do |person|
      Grouper::Member.new(person)
    end
    @group = Grouper::Group.new
    @group.add_members(people)
  end

  def test_a_group_exists
    assert Grouper::Group
  end

  def test_a_group_has_members
    assert group.members
  end

  def test_members_always_array
    person = "Will"
    group = Grouper::Group.new
    group.add_members(person)
    assert_kind_of Array, group.members
  end

  def test_a_group_can_choose_a_team
    team = group.team_of(2)
    assert_equal 2, team.size
    team.teammates.each do |person|
      assert_includes group.members, person
    end
  end

  def test_a_group_has_teams
    assert group.teams
  end

  def test_a_group_can_add_a_team
    group.add_team_of(2)
    assert_equal 1, group.teams.length
    assert_kind_of Grouper::Team, group.teams[0]
  end

  def test_size_of_members_does_not_change_when_team_chosen
    num_members = group.members.length
    group.add_team_of(2)
    assert_equal num_members, group.members.length
  end

  def test_teams_within_group_share_no_members
    group.add_team_of(2)
    group.add_team_of(2)
    assert group.teams[0].overlap(group.teams[1]).length == 0
  end

  def test_can_auto_generate_teams
    group.teams_of(2)
    assert_equal 2, group.teams.length
  end

  def test_can_place_singles_into_plus_one_teams
    group.add_members('Mark', 'Susan', 'Andi')
    group.teams_of(3)
    assert_equal 2, group.teams.length
  end

end
