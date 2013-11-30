module Grouper
  class Team
    include Comparable

    attr_accessor :teammates

    def initialize(members=nil)
      if members
        @teammates = members.collect {|member| Member.new(member)}
      end
    end

    def size
      @teammates.length
    end

    def overlap(other)
      teammates & other.teammates
    end

    def add_member(member)
      @teammates << member
    end

    def <=>(other)
      teammates.sort <=> other.teammates.sort
    end

    def valid?
      teammates.all? do |member|
        member.has_worked_with(teammates) == false
      end
    end

    def mark_members
      teammates.each do |member|
        member.add_worked_with(teammates - [member])
      end
    end

  end
end
