module Grouper
  class Team
  
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
  end
end
