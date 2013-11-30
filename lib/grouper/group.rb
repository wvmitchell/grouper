module Grouper
  class Group

    attr_accessor :members

    def teams_of(size, ordered_members)
      unteamed = ordered_members
      group_size = ordered_members.length
      num_teams = group_size/size
      plus_one_teams = group_size%size
      regular_teams = num_teams - plus_one_teams
      num_teams.times.collect do |t|
        t < regular_teams ? team_of(size, unteamed) : team_of(size+1, unteamed)
      end
    end

    def team_of(size, members)
      Team.new(members.shift(size))
    end

    def unique_teams(size, count)
      unique_teams = []
      members.permutation.each do |p|
        teams = teams_of(size, p)
        unique_teams << teams unless unique_teams.include?(teams)
        break if unique_teams.count > count
      end
      unique_teams
    end

  end
end
