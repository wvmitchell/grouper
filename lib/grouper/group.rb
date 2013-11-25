module Grouper
  class Group

    attr_reader :members, :teams

    def initialize
      @members = []
      @teams = []
      @unteamed_members = []
    end

    def add_members(*people)
      new_members = [people].flatten
      new_members.each do |member|
        @members << member
        @unteamed_members << member
      end
    end

    def teams_of(size)
      while unassigned_members?
        can_make_full_team?(size) ? add_team_of(size) : assign_singles
      end
    end

    def add_team_of(size)
      @teams << team_of(size)
    end

    def team_of(size)
      Team.new(@unteamed_members.pop(size))
    end

    def unassigned_members?
      @unteamed_members.length > 0
    end

    def can_make_full_team?(size)
      @unteamed_members.length/size > 0
    end

    def assign_singles
      @unteamed_members.each_with_index do |member, i|
        teams[i].add_member(@unteamed_members.pop)
      end
    end

  end
end
