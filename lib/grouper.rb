require "grouper/version"

module Grouper
  class Group

    attr_reader :members, :teams

    def initialize
      @members = []
      @teams = []
    end

    def add_members(*people)
      new_members = [people].flatten
      new_members.each {|member| @members << member}
    end

    def add_team_of(selection)
      @teams << team_of(selection)
    end

    def team_of(selection)
      Team.new(members.pop(selection))
    end

  end

  class Team

    attr_reader :teammates
    
    def initialize(members)
      @teammates = members
    end

    def size
      @teammates.length
    end
  end
end
