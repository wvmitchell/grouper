module Grouper
  class Team
    include Comparable

    attr_reader :teammates

    def initialize(members)
      @teammates = members
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

  end
end
