module Swappy
  class Swapper
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def swap
      config = Config.new
      config.each do |link_set|
        puts link_set.name
      end
    end
  end
end
