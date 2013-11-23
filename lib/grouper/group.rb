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

    def add_team_of(selection)
      @teams << team_of(selection)
    end

    def team_of(selection)
      Team.new(@unteamed_members.pop(selection))
    end
  end
end
