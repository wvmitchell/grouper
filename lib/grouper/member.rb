module Grouper
  class Member
    include Comparable

    attr_reader :name, :worked_with

    def initialize(name)
      @name = name
      @worked_with = []
    end

    def has_worked_with(members)
      members.any? do |member|
        worked_with.include? member
      end
    end

    def add_worked_with(members)
      members.each do |member|
        worked_with << member
      end
    end

    def <=>(other)
      name <=> other.name
    end
  end
end
