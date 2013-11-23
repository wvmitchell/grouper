require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grouper'

class GrouperTest < MiniTest::Test

  def test_a_group_exists
    assert Grouper::Group
  end

  def test_a_group_has_members
    people = ['Will', 'Logan', 'Eric', 'Layla']
    group = Grouper::Group.new
    group.add_members(people)
    assert_equal people, group.members
  end

  def test_members_always_array
    person = "Will"
    group = Grouper::Group.new
    group.add_members(person)
    assert_kind_of Array, group.members
  end

  def test_a_group_can_choose_a_team
    people = ['Will', 'Logan', 'Eric', 'Layla']
    group = Grouper::Group.new
    group.add_members(people)
    team = group.team_of(2)
    assert_equal 2, team.size
    team.teammates.each do |person|
      assert_includes people, person
    end
  end

  def test_a_group_has_teams
    group = Grouper::Group.new
    assert group.teams
  end

  def test_a_group_can_add_a_team
    people = ['Will', 'Logan', 'Eric', 'Layla']
    group = Grouper::Group.new
    group.add_members(people)
    group.add_team_of(2)
    assert_equal 1, group.teams.length
    assert_kind_of Grouper::Team, group.teams[0]
  end

  def test_size_of_members_does_not_change_when_team_chosen
    people = ['Will', 'Logan', 'Eric', 'Layla']
    group = Grouper::Group.new
    group.add_members(people)
    num_members = group.members.length
    group.add_team_of(2)
    assert_equal num_members, group.members.length
  end

  def test_teams_within_group_share_no_members
    people = ['Will', 'Logan', 'Eric', 'Layla']
    group = Grouper::Group.new
    group.add_members(people)
    group.add_team_of(2)
    group.add_team_of(2)
    assert_equal 0, (group.teams[0].teammates & group.teams[1].teammates).length
  end

end
